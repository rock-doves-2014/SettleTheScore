class Confrontation < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_one :rebuttal

  def calculate_votes
    trues = self.votes.where(vote: true).count
    [trues, self.votes.count - trues]
  end
end
