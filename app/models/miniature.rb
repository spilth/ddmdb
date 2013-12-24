class Miniature < ActiveRecord::Base
  belongs_to :type
  belongs_to :subtype
  belongs_to :release
  belongs_to :size
  belongs_to :rarity

  has_many :user_miniatures
  has_many :users, through: :user_miniatures

  validates :name, presence: true
  validates :number, presence: true, numericality: true

  acts_as_taggable
end

