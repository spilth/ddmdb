module MiniaturesHelper
  LEVEL_XP = {
    1 => 100,
    2 => 125,
    3 => 150,
    4 => 175,
    5 => 200,
    6 => 250,
    7 => 300,
    8 => 350,
    9 => 400,
    10 => 500,
    11 => 600,
    12 => 700,
    13 => 800,
    14 => 1000,
    15 => 1200,
    16 => 1400,
    17 => 1600,
    18 => 2000,
    19 => 2400,
    20 => 2800,
    21 => 3200,
    22 => 4150,
    23 => 5100,
    24 => 6050,
    25 => 7000,
    26 => 9000,
    27 => 11000,
    28 => 13000,
    29 => 15000,
    30 => 19000,
    31 => 23000,
    32 => 27000,
    33 => 31000,
    34 => 39000,
    35 => 47000,
    36 => 55000,
    37 => 63000,
    38 => 79000,
    39 => 95000,
    40 => 111000
  }

  def format_leader(miniature)
    if miniature.leader
      link_to "Leader", leaders_path
    end
  end
  
  def calculate_xp(miniature)
    if !miniature.level.nil? && !miniature.difficulty.nil? && !miniature.role.nil?
      return "XP " + number_with_delimiter((LEVEL_XP[miniature.level] * miniature.difficulty.xp_multiplier * miniature.role.xp_multiplier).to_i)
    end
  end

  def image_name(miniature)
    return "#{sprintf("%02d", miniature.release_id)}#{sprintf("%02d", miniature.number)}"
  end

  # Miniature Images
    
  def thumbnail(miniature)
    return image_tag("http://ddm-images.s3.amazonaws.com/miniatures/thmb_#{image_name(miniature)}.jpg")
  end
  
  def large_image(miniature)
    return link_to image_tag("http://ddm-images.s3.amazonaws.com/miniatures/#{image_name(miniature)}.jpg", :alt => "#{miniature.name} Miniature", :class => "figure"), "http://ddm-images.s3.amazonaws.com/miniatures/#{image_name(miniature)}.jpg"
  end

  # Stat Card Images
  
  def skirmish_card(miniature) 
    return image_tag("http://ddm-images.s3.amazonaws.com/cards/#{miniature.release.abbreviation}/#{sprintf("%02d", miniature.number)}S.gif", :alt => "#{miniature.name} Skirmish Card", :align => "top")
  end
  
  def rpg_card(miniature)
    return image_tag("http://ddm-images.s3.amazonaws.com/cards/#{miniature.release.abbreviation}/#{sprintf("%02d", miniature.number)}R.gif", :alt => "#{miniature.name} RPG Card", :align => "top")
  end
  
end
