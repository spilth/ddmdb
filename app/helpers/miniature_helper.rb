module MiniatureHelper
  def miniature_thumbnail(miniature)
    "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/thumbs/%02d%02d_thmb.jpg" % [miniature.release_id, miniature.number]
  end

  def miniature_image(miniature)
    "http://ddmdb-images.spilth.org.s3-website-us-east-1.amazonaws.com/images/miniatures/%02d%02d.jpg" % [miniature.release_id, miniature.number]
  end
end
