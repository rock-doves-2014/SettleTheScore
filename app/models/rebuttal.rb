class Rebuttal < ActiveRecord::Base
  belongs_to :user
  belongs_to :confrontation

  def update_confrontation_updated_at_time
    self.confrontation.touch
  end
end
