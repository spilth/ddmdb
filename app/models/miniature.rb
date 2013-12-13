class Miniature < ActiveRecord::Base
  belongs_to :type
  belongs_to :subtype

  validates :name, presence: true
  validates :type, presence: true
  validates :subtype, presence: true
end
