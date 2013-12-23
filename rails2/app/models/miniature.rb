class Miniature < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable

  # General
  belongs_to :release
  belongs_to :size
  belongs_to :rarity
  belongs_to :setting

  # 3rd Edition
  belongs_to :type
  belongs_to :subtype
  belongs_to :source
  belongs_to :source2, :class_name => "Source", :foreign_key => "source2_id"

  # 4th Edition
  belongs_to :difficulty
  belongs_to :role
  belongs_to :origin
  belongs_to :kind
  has_and_belongs_to_many :keywords
  
  has_many :ownerships
  has_many :owners, :through => :ownerships, :source => :user, :uniq => true, :conditions => "ownerships.have_count > 0"
  has_many :fans, :through => :ownerships, :source => :user, :conditions => ["ownerships.favorite = ?", true]

  # Validations

  # Scopes

  named_scope :with_include, :include => [:release, :rarity, :size, :type, :source, :subtype, :setting, :difficulty, :role, :origin, :kind]
  named_scope :sorted, lambda { |sort| {
    :order => "#{sort}"
  }}

  # General
  named_scope :by_release, :order => "releases.name, miniatures.number"
  named_scope :by_size, :order => "sizes.id, types.name, subtypes.name, miniatures.name"
  named_scope :by_rarity, :order => "rarities.id"
  named_scope :by_setting, :order => "settings.name, types.name, subtypes.name, miniatures.name"
  named_scope :by_tag, :order => "types.name, subtypes.name, miniatures.name"

  # 3rd Edition
  named_scope :with_include3, :include => [:release, :rarity, :size, :type, :source, :subtype, :setting]
  named_scope :by_type, :order => "types.name, subtypes.name, miniatures.name"
  named_scope :by_subtype, :order => "types.name, subtypes.name, miniatures.name"
  named_scope :by_source, :order => "sources.name, miniatures.source_page_number, miniatures.name"
  named_scope :by_cr, :order => "miniatures.challenge_rating, types.name, subtypes.name, miniatures.name"
  named_scope :challenge_rating, lambda { |cr| {
    :conditions => "challenge_rating = #{cr}"
  }}
  
  # 4th Edition
  named_scope :with_include4, :include => [:release, :rarity, :size, :source2, :setting, :difficulty, :role, :origin, :kind, :type, :subtype]
  named_scope :by_difficulty, :order => "difficulties.id, roles.name, origins.name, kinds.name"
  named_scope :by_role, :order => "roles.name, difficulties.id, origins.name, kinds.name"
  named_scope :by_origin, :order => "kinds.name, difficulties.name, roles.name, miniatures.name"
  named_scope :by_kind, :order => "kinds.name, origins.name, miniatures.name"
  named_scope :by_keyword, :order => "origins.name, kinds.name, miniatures.name"
  named_scope :leaders, :conditions => ["leader = ?", true]
  named_scope :by_level, :order => "difficulties.id, roles.name, origins.name, kinds.name"
  named_scope :level, lambda { |level| {
    :conditions => "level = #{level}"
  }}

  # Missing Information
  named_scope :rarityless, :conditions => "miniatures.rarity_id IS null"
  named_scope :releaseless, :conditions => "miniatures.release_id IS null"
  named_scope :sizeless, :conditions => "miniatures.size_id IS null"
  named_scope :sourceless, :conditions => "miniatures.source_id IS null"
  named_scope :source2less, :conditions => "miniatures.source2_id IS null"
  named_scope :typeless, :conditions => "miniatures.type_id IS null"
  named_scope :subtypeless, :conditions => "miniatures.subtype_id IS null"
  named_scope :crless, :conditions => "miniatures.challenge_rating IS null"
  named_scope :leveless, :conditions => "miniatures.level IS null"
  named_scope :difficultyless, :conditions => "miniatures.difficulty_id IS null"
  named_scope :roleless, :conditions => "miniatures.role_id IS null"
  named_scope :originless, :conditions => "miniatures.origin_id IS null"
  named_scope :kindless, :conditions => "miniatures.kind_id IS null"
  
  def self.search(key)
    operator = (RAILS_ENV == 'production') ? 'ilike' : 'like' # postgresql vs mysql case-insensitivity
    conds = ["miniatures.name #{operator} ?", "%#{key}%"]
    find(:all, :conditions => conds)
  end
end

