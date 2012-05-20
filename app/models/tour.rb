class Tour < ActiveRecord::Base
  attr_accessible :description, :guide_id, :title, :image, :banner, :price, :hours
  has_attached_file :image
  has_attached_file :banner
  acts_as_taggable_on :topics, :times
end
