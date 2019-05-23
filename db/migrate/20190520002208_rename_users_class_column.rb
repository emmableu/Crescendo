class RenameUsersClassColumn < ActiveRecord::Migration
  def change
    rename_column :users, :class, :student_class
  end
end
