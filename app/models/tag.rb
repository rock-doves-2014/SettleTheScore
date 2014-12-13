class Tag < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :confrontation_tags
  has_many :confrontations, through: :confrontation_tags

end
