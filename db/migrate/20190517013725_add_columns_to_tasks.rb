class AddColumnsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :instruction, :text
    add_column :tasks, :description, :text
  end
end
