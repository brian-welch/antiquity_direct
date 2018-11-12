class CreateArtifacts < ActiveRecord::Migration[5.2]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :discount
      t.string :photo
      t.boolean :free_shipping
      t.references :cultural_origins, foreign_key: true
      t.references :artifact_types, foreign_key: true
      t.references :time_periods, foreign_key: true

      t.timestamps
    end
  end
end
