class AddPaletteStartIndexToMinitasks < ActiveRecord::Migration
  def change
    add_column :minitasks, :palette_start_index, :integer
  end
end
