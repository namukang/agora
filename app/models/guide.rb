class Guide < ActiveRecord::Base
  attr_accessible :description, :name, :image
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
end
