class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.integer :guide_id
      t.string :image

      t.timestamps
    end
  end
end
