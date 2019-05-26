class ChangeColumnNameTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :script, :correctscript
  end
end
