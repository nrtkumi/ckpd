class CreateWays < ActiveRecord::Migration[5.0]
  def change
    create_table :ways do |t|
      t.text :content
      t.integer :recipe_id

      t.timestamps
    end
  end
end
