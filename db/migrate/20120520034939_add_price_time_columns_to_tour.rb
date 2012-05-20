class AddPriceTimeColumnsToTour < ActiveRecord::Migration
  def change
    add_column :tours, :price, :integer
    add_column :tours, :hours, :integer
  end
end
