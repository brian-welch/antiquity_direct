class ChangeDiscountColumnDefaultInArtifact < ActiveRecord::Migration[5.2]
  def change
    change_column_default :artifacts, :discount, 0
  end
end
