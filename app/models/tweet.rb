class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  
  def self.search(search)
    return Tweet.all  unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end  
end
