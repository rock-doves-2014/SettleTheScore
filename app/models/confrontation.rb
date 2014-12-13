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

  # def update_tags(tags)
  #   self.tags.clear
  #   create_tags(tags)
  # end

end
