module CollectionsHelper

  def favorite_icon(user, miniature)
    if is_favorite?(user, miniature)
      link_to image_tag("/images/icons/favorite-on.png"), remove_favorite_path(miniature.id)
    else
      link_to image_tag("/images/icons/favorite-off.png"), add_favorite_path(miniature.id)
    end
  end

  def set_count(user, miniature, count)
    ownership = user.ownerships.find_by_miniature_id(miniature.id) || Ownership.new
    ownership.user = user
    ownership.miniature = miniature
    ownership.have_count = count
    ownership.save!
  end
  
  def get_user_miniature_count(user, miniature)
    ownerships = user.ownerships
  	ownership = user.ownerships.find_by_miniature_id(miniature.id)
  	if ownership.nil?
  		return 0
  	else
  		return ownership.have_count
  	end
  end

  def set_favorite(user, miniature, is_favorite)
    ownership = user.ownerships.find_by_miniature_id(miniature.id) || Ownership.new
    ownership.user = user
    ownership.miniature = miniature
    ownership.favorite = is_favorite
    ownership.save!
  end

  def is_favorite?(user, miniature)
    ownership = user.ownerships.find_by_miniature_id(miniature.id) || Ownership.new
    return ownership.favorite
  end

end
