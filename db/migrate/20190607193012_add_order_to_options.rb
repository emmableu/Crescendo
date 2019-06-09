class AddOrderToOptions < ActiveRecord::Migration
  def change
    add_column :options, :order, :integer
    rename_column :options, :quizbody, :optionbody
  end
end
