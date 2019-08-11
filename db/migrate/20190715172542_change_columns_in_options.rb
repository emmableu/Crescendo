class ChangeColumnsInOptions < ActiveRecord::Migration
  def change
    rename_column :options, :comment, :comment_en

    add_column :options, :comment_zh, :text

  end
end

