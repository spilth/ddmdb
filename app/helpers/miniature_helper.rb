module MiniatureHelper
  def miniature_thumbnail(miniature)
    "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/thumbs/%02d%02d_thmb.jpg" % [miniature.release_id, miniature.number]
  end

  def miniature_image(miniature)
    "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/miniatures/%02d%02d.jpg" % [miniature.release_id, miniature.number]
  end

  def miniature_count_for_user(miniature, user)
    user_miniature = UserMiniature.find_by_user_id_and_miniature_id(user.id, miniature.id)
    user_miniature ? user_miniature.count : 0
  end
end
