class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :image
      t.integer :user_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
