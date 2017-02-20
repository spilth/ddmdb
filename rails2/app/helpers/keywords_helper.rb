module KeywordsHelper

  def format_keywords(keywords)
    keywords.collect {|keyword| keyword.name.downcase}.join(", ")
  end

end
