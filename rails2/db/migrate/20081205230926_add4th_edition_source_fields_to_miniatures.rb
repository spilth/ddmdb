class Add4thEditionSourceFieldsToMiniatures < ActiveRecord::Migration
  def self.up
    add_column :miniatures, :source2_id, :integer
    add_column :miniatures, :source2_page_number, :integer
  end

  def self.down
    remove_column :miniatures, :source2_id
    remove_column :miniatures, :source2_page_number
  end
end
