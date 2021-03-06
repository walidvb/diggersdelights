require 'spec_helper'

describe LinksController do
  
  let :response_json do
    JSON.parse(response.body)
  end

  before do
    request.env['warden'].stub :authenticate! => me
    controller.stub :current_user => me
  end
  
  let :clique do 
    Fabricate(:clique, name: "my clique")
  end

  let :me do 
    Fabricate(:user, name: "Me", cliques: [clique])
  end

  let :user do 
    Fabricate(:user, cliques: [clique])
  end

  let :user2 do 
    Fabricate(:user, cliques: [clique])
  end

  let :cliqueB do 
    Fabricate(:clique, name: "cliqueB")
  end

  let :userB do 
    Fabricate(:user, cliques: [cliqueB])
  end

  let :url do 
    "https://www.youtube.com/watch?v=8QZ8-OCrB5s"
  end

  describe '#index' do
    render_views
    let! :link do
      link = Fabricate(:link, url: url)
      link.assign_to users: [me, user], cliques: [clique]
      link.save
      return link
    end

     it 'returns the users assigned to the link for that clique' do 
      get :index, params: { format: :json }
      expect(response_json["links"][0]["users"].map{|u| u["id"]}).to eq([me.id, user.id])
    end
  end

  describe "#create" do 
    let :link do
      link = Fabricate.build(:link, url: url) 
      link.assign_to users: [user], cliques: [clique.id]
      return link
    end

    it 'sets visibility' do 
      post :create, params: { link: {url: url, published: true }}
      expect(LinkCliqueAssignment.last).to be_visible
    end

    context "with valid oembed source" do 
      it "returns the link" do 
        expect { 
          post :create, params: { link: {url: url, clique_ids: [clique.id]}}
        }.to change(Link, :count).by(1)
      end

      it "creates mentions" do 
        expect {
            post :create, params: { link: {url: url, clique_ids: [clique.id], mentions: [user2.id]}}
          }.to change(ActivityNotification::Notification, :count).by(1)
      end

      context "when already posted in the clique by someone else" do 
        before do 
          link.save
        end

        it "doesn't duplicate the link" do 
          expect { 
            post :create, params: { link: {url: url, clique_ids: [clique.id]}}
          }.to change(Link, :count).by(0)
        end

        it "adds an assignment to a clique" do
          expect { 
            post :create, params: { link: {url: url, clique_ids: [clique.id]}}
          }.to change(LinkCliqueAssignment, :count).by(1)
        end

        it "creates an unexisting playlist and adds it to it" do
          expect { 
            post :create, params: { link: {url: url, playlist_ids: ["test"]}}
          }.to change(me.playlists, :count).by(1)
        end

        it "adds to existing playlist" do
          pl = Fabricate :playlist
          pl.links << Fabricate(:link, url: 'https://www.youtube.com/watch?v=MJi4TCMxOMY')
          expect(pl.links.count).to eq(1)
          expect { 
            post :create, params: { link: {url: url, playlist_ids: [pl.id]}}
          }.to change(pl.reload.links, :count).by(1)
        end
      end
    end

    context "without valid oembed source" do 
      let :url do
        "http://example.com"
      end

      it 'still creates the link' do
        expect { 
          post :create, params: { link: {url: url, clique_ids: [clique.id]}}
        }.to change(Link, :count).by(1)
      end
    end

  end
end
