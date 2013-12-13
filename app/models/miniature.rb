class Miniature < ActiveRecord::Base
  belongs_to :type
  belongs_to :subtype
end
