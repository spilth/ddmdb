class Miniature < ActiveRecord::Base
  belongs_to :type
  belongs_to :subtype
  belongs_to :release

  validates :name, presence: true
  validates :type, presence: true
  validates :subtype, presence: true
  validates :release, presence: true
end
