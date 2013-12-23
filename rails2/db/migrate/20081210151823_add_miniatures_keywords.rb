class AddMiniaturesKeywords < ActiveRecord::Migration
  def self.up
    create_table :keywords_miniatures, :id => false do |t|
      t.column :keyword_id, :int, :null => false
	    t.column :miniature_id, :int, :null => false
    end
 
    add_index :keywords_miniatures, [:keyword_id, :miniature_id]
    add_index :keywords_miniatures, :keyword_id
  end

  def self.down
    drop_table :keywords_miniatures
  end
end
