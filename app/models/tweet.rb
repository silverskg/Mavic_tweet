class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  has_many :liked_tweets, through: :likes, source: :user

  def liked_by?(user)
    likes.find_by(user_id: user.id).present?
  end
  
  def self.search(search)
    return Tweet.all  unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end  
end
