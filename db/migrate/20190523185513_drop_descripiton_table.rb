class DropDescripitonTable < ActiveRecord::Migration
  def up
    drop_table :descripitons
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
