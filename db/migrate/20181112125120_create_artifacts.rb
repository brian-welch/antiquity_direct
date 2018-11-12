class CreateArtifacts < ActiveRecord::Migration[5.2]
  def change
    create_table :artifacts do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :discount
      t.string :photo
      t.boolean :free_shipping
      t.references :cultural_origin, foreign_key: true
      t.references :time_period, foreign_key: true
      t.references :artifact_type, foreign_key: true

      t.timestamps
    end
  end
end
