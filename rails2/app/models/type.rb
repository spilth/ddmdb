class Type < ActiveRecord::Base
  has_many :miniatures

  named_scope :by_name, :order => "name"

end
