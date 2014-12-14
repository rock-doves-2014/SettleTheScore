class Confrontation < ActiveRecord::Base
  belongs_to :user
  has_many :votes
  has_one :rebuttal
  has_many :confrontation_tags
  has_many :tags, through: :confrontation_tags

  validates :title, presence: true
  validates :argument, presence: true

  def calculate_votes
    trues = self.votes.where(vote: true).count
    [trues, self.votes.count - trues]
  end

  def create_tags(tags)
    tags.split(',').each do |tag|
      self.tags << Tag.find_or_create_by(name: tag.strip)
    end
    self.save
  end

  def display_tags
    self.tags.map { |tag| tag.name  }.join(',')
  end

  def expiration_time
    self.updated_at + 86400
  end

  def time_remaining_until_expired
    if self.rebuttal.created_at != self.rebuttal.updated_at
      expiration_time
    end
  end

  def time_expired?
    (Time.now - self.updated_at)/3600 >= 24
  end

  def create_rebuttal(name)
  opponent = User.find_by(name: name)
  Rebuttal.create(counterargument: "Unanswered" , user_id: opponent.id, confrontation_id: self.id)
  end

  def winner
    if self.calculate_votes[0] > self.calculate_votes[1]
      [self.user.email, self.user.name]
    else
      [self.rebuttal.user.email,self.rebuttal.user.name]
    end
  end

end
