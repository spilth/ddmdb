class AddOriginAndTypeToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :origin_id, :integer
    add_column :miniatures, :kind_id, :integer
  end

  def self.down
    remove_column :miniatures, :origin_id
    remove_column :miniatures, :kind_id
  end

end
