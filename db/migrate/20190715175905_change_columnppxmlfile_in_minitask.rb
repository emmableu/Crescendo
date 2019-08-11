class ChangeColumnppxmlfileInMinitask < ActiveRecord::Migration
  def change
    rename_column :minitasks, :ppxmlfile, :ppxmlfile_en

    add_column :minitasks, :ppxmlfile_zh, :text

  end
end


