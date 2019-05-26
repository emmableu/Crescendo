class ChangeColumnDefaultFromTestscript < ActiveRecord::Migration
  # class ChangeColumnFromTestscript < ActiveRecord::Migration
    def change
      change_column :testscripts, :scriptarray, :string, array: true, null: false, default: nil

    end
  # end
end
