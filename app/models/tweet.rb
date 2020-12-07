class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy

  has_many :liked_users, through: :likes, source: :user

  def liked_by?(current_user)
    likes.find_by(user_id: user.id).present?
  end

  after_create do
    # lockメソッドを使う
    if Tweet.lock.where(user_id: self.user_id, text: self.text).count > 1
      raise ActiveRecord::RecordNotUnique.new(self)
    end
  end
  
  def self.search(search)
    return Tweet.all  unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end  
end
