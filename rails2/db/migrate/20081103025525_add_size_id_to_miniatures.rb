class AddSizeIdToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :size_id, :integer
  end

  def self.down
    remove_column :miniatures, :size_id
  end
end
