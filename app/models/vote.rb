class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :confrontation

  def toggle_vote!
    self.vote = !self.vote
    self.save
  end
  def true_vote
    self.vote = true if self.vote.nil?
    self.save
  end

  def false_vote
    self.vote = false if self.vote.nil?
    self.save
  end

end
