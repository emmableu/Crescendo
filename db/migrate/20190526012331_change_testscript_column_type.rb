class ChangeTestscriptColumnType < ActiveRecord::Migration
  def change
    change_column :testscripts,:scriptarray, :text, array: false
  end
end
