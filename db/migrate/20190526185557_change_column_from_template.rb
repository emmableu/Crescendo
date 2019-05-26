class ChangeColumnFromTemplate < ActiveRecord::Migration
  def change
    rename_column :templates, :type, :template_name
  end
end
