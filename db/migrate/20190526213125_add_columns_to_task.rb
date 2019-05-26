class AddColumnsToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :scriptarray, :text
    add_column :tasks, :scriptarraytwo, :text
  end
end
