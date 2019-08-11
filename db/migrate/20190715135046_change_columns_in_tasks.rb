class ChangeColumnsInTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :title, :title_en

    add_column :tasks, :title_zh, :string

  end
end
