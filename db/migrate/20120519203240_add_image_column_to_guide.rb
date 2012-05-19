class AddImageColumnToGuide < ActiveRecord::Migration
  def self.up
    change_table :guides do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :guides, :image
  end
end
