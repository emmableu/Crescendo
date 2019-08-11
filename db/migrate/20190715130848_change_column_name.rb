class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :minitasks, :title, :title_en
    rename_column :minitasks, :instruction, :instruction_en
    rename_column :minitasks, :test_file, :test_file_en
    add_column :minitasks, :title_zh, :text
    add_column :minitasks, :instruction_zh, :text
    add_column :minitasks, :test_file_zh, :text

  end
end
