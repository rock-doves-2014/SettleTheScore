class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :confrontation

  def toggle_vote!
    self.vote = !self.vote
  end
end
