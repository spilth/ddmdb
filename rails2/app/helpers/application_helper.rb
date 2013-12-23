# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  include TagsHelper

  def list_miniatures(list_mode)
    if list_mode == "3"
      partial = "shared/miniatures"
    else
      partial = "shared/miniatures4"
    end

    render(:partial => partial)
  end
  
  def add_icon
    return "/images/icons/add.png"
  end

  def edit_icon
    return "/images/icons/edit.png"
  end

  def delete_icon
    return "/images/icons/delete.png"
  end
  
  def is_admin?
    return administrator?
  end

  def format_cr(challenge_rating)
    if challenge_rating == nil
      return "N/A"
    end
    
    if challenge_rating == 0.5
      return "&#0189;"
    end
    
    if challenge_rating == 0.33
      return "1/3"
    end
    
    if challenge_rating == 0.25
      return "&#0188;"
    end
    
    return challenge_rating.to_i
  end
  
end
