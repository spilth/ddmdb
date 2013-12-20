class MiniatureDecorator < Draper::Decorator
  delegate_all

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
