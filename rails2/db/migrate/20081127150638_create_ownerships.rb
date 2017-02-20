class CreateOwnerships < ActiveRecord::Migration
  def self.up
    create_table :ownerships do |t|
      t.column :user_id, :int, :null => false
      t.column :miniature_id, :int, :null => false
      t.column :have_count, :integer, :null => false, :default => 0
    end
  end

  def self.down
    drop_table :ownerships
  end
end
