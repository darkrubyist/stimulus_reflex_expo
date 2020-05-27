class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.string :slug
      t.string :session_id

      t.timestamps
    end
  end
end
