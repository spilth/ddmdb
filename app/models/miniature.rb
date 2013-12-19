class Miniature < ActiveRecord::Base
  belongs_to :type
  belongs_to :subtype
  belongs_to :release
  belongs_to :size
  belongs_to :rarity

  validates :name, presence: true
  validates :release, presence: true
  validates :number, presence: true, numericality: true

  def release_name
    release ? release.name : ""
  end

  def type_name
    type ? type.name : ""
  end

  def subtype_name
    subtype ? subtype.name : ""
  end

  def size_abbreviation
    size ? size.abbreviation : ""
  end

  def rarity_abbreviation
    rarity ? rarity.abbreviation : ""
  end
end
