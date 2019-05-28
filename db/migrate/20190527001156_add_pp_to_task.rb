class AddPpToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :ppxmlfile, :text
  end
end
