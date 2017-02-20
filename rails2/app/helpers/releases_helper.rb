module ReleasesHelper

  def release_thumbnail(release)
    return image_tag("/images/symbols/thmb_#{release.path}.jpg", :height => 32)
  end
  
  def release_image(release)
    return image_tag("/images/symbols/#{release.path}.jpg", :class => "symbol")
  end

end
