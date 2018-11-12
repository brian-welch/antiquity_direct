class CreateCulturalOrigins < ActiveRecord::Migration[5.2]
  def change
    create_table :cultural_origins do |t|
      t.string :name

      t.timestamps
    end
  end
end
