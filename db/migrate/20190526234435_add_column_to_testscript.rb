class AddColumnToTestscript < ActiveRecord::Migration
  def change
    add_column :testscripts, :blockarray, :text
    add_column :testscripts, :blockxmlarray, :text
  end
end
