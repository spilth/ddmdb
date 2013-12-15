class Miniature < ActiveRecord::Base
  belongs_to :type
  belongs_to :subtype
  belongs_to :release
  belongs_to :size

  validates :name, presence: true
  validates :release, presence: true
  validates :number, presence: true, numericality: true
end
