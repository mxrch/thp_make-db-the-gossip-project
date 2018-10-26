class GossipTag < ApplicationRecord
  belongs_to :gossip, optional: true
  belongs_to :tag
end
