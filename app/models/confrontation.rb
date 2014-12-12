class Confrontation < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_one :rebuttal
end
