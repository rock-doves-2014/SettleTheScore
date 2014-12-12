class Rebuttal < ActiveRecord::Base
  belongs_to :user
  belongs_to :confrontation
end
