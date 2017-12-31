class LinkCliqueAssignment < ActiveRecord::Base
    belongs_to :clique, inverse_of: :link_clique_assignments
    belongs_to :link, inverse_of: :link_clique_assignments
end