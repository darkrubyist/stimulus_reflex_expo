class CreateRestaurantMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_menus do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.string :title, null: false
      
      t.timestamps
    end
  end
end
