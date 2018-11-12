class ChangeColumnDefaultInArtifact < ActiveRecord::Migration[5.2]
  def change
    change_column_default :artifacts, :free_shipping, false
  end
end
