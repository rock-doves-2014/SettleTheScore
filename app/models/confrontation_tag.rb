class ConfrontationTag < ActiveRecord::Base
  belongs_to :confrontation
  belongs_to :tag
end
