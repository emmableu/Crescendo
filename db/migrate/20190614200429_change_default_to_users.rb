class ChangeDefaultToUsers < ActiveRecord::Migration
  def down
    change_column_default( :users, :progression, 0)
  end
end
