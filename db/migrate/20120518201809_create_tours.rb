class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.int :guide_id

      t.timestamps
    end
  end
end
