class Source < ActiveRecord::Base
  has_many :miniatures
  has_many :miniatures2, :foreign_key => "source2_id", :class_name => "Miniature"
  
  named_scope :by_name, :order => "name"
  named_scope :by_edition, :order => "edition, name"
  
  named_scope :third_edition, :order => "name", :conditions => ["edition = 3"]
  named_scope :fourth_edition, :order => "name", :conditions => ["edition = 4"]
end
