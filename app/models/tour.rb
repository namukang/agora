class Tour < ActiveRecord::Base
  attr_accessible :description, :guide_id, :title, :image
  has_attached_file :image, :styles => { :medium => "360x270>", :thumb => "160x120>" }
end
