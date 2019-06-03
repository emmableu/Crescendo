class AddProgressionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :progression, :integer
  end
end
