class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :label
      t.string :url
      t.string :ingredients
      t.string :health_labels
      t.string :diet_labels
      t.string :image
      t.string :summary
      t.integer :yield

      t.timestamps
    end
  end
end
