class RemoveStringFromTestscript < ActiveRecord::Migration
  def change
    remove_column :testscripts, :string, :string
  end
end
