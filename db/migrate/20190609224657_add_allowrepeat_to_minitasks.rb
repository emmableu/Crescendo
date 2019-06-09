class AddAllowrepeatToMinitasks < ActiveRecord::Migration
  def change
    add_column :minitasks, :allow_repeat, :integer
  end
end
