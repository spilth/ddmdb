require 'nokogiri'

namespace :import do

  desc 'Import all data from XML'
  task :all => [:releases, :types, :subtypes, :miniatures]

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

      )
      m.id = miniature.xpath("id").text
      m.save!
    end
  end
end
