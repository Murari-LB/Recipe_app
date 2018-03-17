class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|

    	t.integer :user_id
    	t.string :dish_type
    	t.string :recipe_type
    	t.string :user_group
      t.timestamps
    end
  end
end
