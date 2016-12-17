class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image
      t.integer :user_id
      t.text :caption

      t.timestamps
    end
  end
end
