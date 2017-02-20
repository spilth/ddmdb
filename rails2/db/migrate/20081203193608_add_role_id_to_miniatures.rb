class AddRoleIdToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :role_id, :integer
  end

  def self.down
    remove_column :miniatures, :role_id
  end

end
