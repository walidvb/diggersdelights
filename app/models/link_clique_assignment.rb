class LinkCliqueAssignment < ActiveRecord::Base
    belongs_to :clique, inverse_of: :link_clique_assignments
    belongs_to :link, inverse_of: :link_clique_assignments
    belongs_to :user, inverse_of: :link_clique_assignments, counter_cache: true

    scope :visible, ->{ where.not(visible: false)}
    scope :oembedable, ->{ joins(:link).where('links.oembeddable = ?', true) }

    validates :link, uniqueness: { scope: [:clique_id, :user_id] }
    validates_presence_of :user
    # validates :link, uniqueness: { scope: [:playlist_id, :user_id] }
end