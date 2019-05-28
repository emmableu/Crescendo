class AddOrderToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :scriptorder, :text
  end
end
