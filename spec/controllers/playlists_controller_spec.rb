require 'spec_helper'

# describe PlaylistsController do

#   # This should return the minimal set of attributes required to create a valid
#   # Playlist. As you add validations to Playlist, be sure to
#   # adjust the attributes here as well.
#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }

#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # PlaylistsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET #index" do
#     it "returns a success response" do
#       playlist = Playlist.create! valid_attributes
#       get :index, {}, valid_session
#       expect(response).to be_success
#     end
#   end

#   describe "GET #show" do
#     it "returns a success response" do
#       playlist = Playlist.create! valid_attributes
#       get :show, {:id => playlist.to_param}, valid_session
#       expect(response).to be_success
#     end
#   end

#   describe "GET #new" do
#     it "returns a success response" do
#       get :new, {}, valid_session
#       expect(response).to be_success
#     end
#   end

#   describe "GET #edit" do
#     it "returns a success response" do
#       playlist = Playlist.create! valid_attributes
#       get :edit, {:id => playlist.to_param}, valid_session
#       expect(response).to be_success
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Playlist" do
#         expect {
#           post :create, {:playlist => valid_attributes}, valid_session
#         }.to change(Playlist, :count).by(1)
#       end

#       it "redirects to the created playlist" do
#         post :create, {:playlist => valid_attributes}, valid_session
#         expect(response).to redirect_to(Playlist.last)
#       end
#     end

#     context "with invalid params" do
#       it "returns a success response (i.e. to display the 'new' template)" do
#         post :create, {:playlist => invalid_attributes}, valid_session
#         expect(response).to be_success
#       end
#     end
#   end

#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested playlist" do
#         playlist = Playlist.create! valid_attributes
#         put :update, {:id => playlist.to_param, :playlist => new_attributes}, valid_session
#         playlist.reload
#         skip("Add assertions for updated state")
#       end

#       it "redirects to the playlist" do
#         playlist = Playlist.create! valid_attributes
#         put :update, {:id => playlist.to_param, :playlist => valid_attributes}, valid_session
#         expect(response).to redirect_to(playlist)
#       end
#     end

#     context "with invalid params" do
#       it "returns a success response (i.e. to display the 'edit' template)" do
#         playlist = Playlist.create! valid_attributes
#         put :update, {:id => playlist.to_param, :playlist => invalid_attributes}, valid_session
#         expect(response).to be_success
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "destroys the requested playlist" do
#       playlist = Playlist.create! valid_attributes
#       expect {
#         delete :destroy, {:id => playlist.to_param}, valid_session
#       }.to change(Playlist, :count).by(-1)
#     end

#     it "redirects to the playlists list" do
#       playlist = Playlist.create! valid_attributes
#       delete :destroy, {:id => playlist.to_param}, valid_session
#       expect(response).to redirect_to(playlists_url)
#     end
#   end

# end
