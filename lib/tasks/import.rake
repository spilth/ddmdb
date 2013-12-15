require 'nokogiri'

namespace :import do

  desc 'Import all data from XML'
  task :all => [:releases, :types, :subtypes, :sizes, :rarities, :miniatures]

  desc 'Import Releases from XML'
  task :releases => :environment do
    Release.destroy_all

    xml = Nokogiri::XML(open('lib/data/releases.xml'))
    xml.xpath("//release").each do |release|
      r = Release.new(
        name: release.xpath("name").text,
        abbreviation: release.xpath("abbreviation").text,
        count: 0
      )
      r.id = release.xpath("id").text
      r.save!
    end
  end

  desc 'Import Types from XML'
  task :types => :environment do
    Type.destroy_all

    xml = Nokogiri::XML(open('lib/data/types.xml'))
    xml.xpath("//type").each do |type|
      t = Type.new(
        name: type.xpath("name").text,
      )
      t.id = type.xpath("id").text
      t.save!
    end
  end

  desc 'Import Subtypes from XML'
  task :subtypes => :environment do
    Subtype.destroy_all

    xml = Nokogiri::XML(open('lib/data/subtypes.xml'))
    xml.xpath("//subtype").each do |subtype|
      s = Subtype.new(
        name: subtype.xpath("name").text,
      )
      s.id = subtype.xpath("id").text
      s.save!
    end
  end

  desc 'Import Sizes from XML'
  task :sizes => :environment do
    Size.destroy_all

    xml = Nokogiri::XML(open('lib/data/sizes.xml'))
    xml.xpath("//size").each do |size|
      s = Size.new(
        name: size.xpath("name").text,
        abbreviation: size.xpath("abbreviation").text,
      )
      s.id = size.xpath("id").text
      s.save!
    end
  end

  desc 'Import Rarities from XML'
  task :rarities => :environment do
    Rarity.destroy_all

    xml = Nokogiri::XML(open('lib/data/rarities.xml'))
    xml.xpath("//rarity").each do |rarity|
      r = Rarity.new(
        name: rarity.xpath("name").text,
        abbreviation: rarity.xpath("abbreviation").text,
      )
      r.id = rarity.xpath("id").text
      r.save!
    end
  end

  desc 'Import Miniatures from XML'
  task :miniatures => :environment do
    Miniature.destroy_all

    xml = Nokogiri::XML(open('lib/data/miniatures.xml'))
    xml.xpath("//miniature").each do |miniature|
      m = Miniature.new(
        name: miniature.xpath("name").text,
        number:  miniature.xpath("number").text,
        release_id:  miniature.xpath("release-id").text,
        type_id:  miniature.xpath("type-id").text,
        subtype_id:  miniature.xpath("subtype-id").text,
        size_id:  miniature.xpath("size-id").text,
        rarity_id:  miniature.xpath("rarity-id").text,
      )
      m.id = miniature.xpath("id").text
      m.save!
    end
  end
end
