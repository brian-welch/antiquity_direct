class RenameColumnInCondition < ActiveRecord::Migration[5.2]
  def change
    rename_column :conditions, :condition, :name
  end
end
