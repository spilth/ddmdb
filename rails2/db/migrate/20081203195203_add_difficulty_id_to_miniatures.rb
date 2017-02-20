class AddDifficultyIdToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :difficulty_id, :integer
  end

  def self.down
    remove_column :miniatures, :difficulty_id
  end
end
