class ChangeColumnInArtifacts < ActiveRecord::Migration[5.2]
  def change
    rename_column :artifacts, :discount, :percent_discount
  end
end
