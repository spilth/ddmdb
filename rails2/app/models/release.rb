class Release < ActiveRecord::Base
  has_many :miniatures
  default_scope :order => 'released_on desc'
end
