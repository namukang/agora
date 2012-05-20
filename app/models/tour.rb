class Tour < ActiveRecord::Base
  attr_accessible :description, :guide_id, :title, :image
  has_attached_file :image
  acts_as_taggable_on :topics, :times
end
