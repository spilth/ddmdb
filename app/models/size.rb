class Size < ActiveRecord::Base
  has_many :miniatures

  validates :name, presence: true
  validates :abbreviation, presence: true
end
