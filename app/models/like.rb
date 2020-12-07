class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :user_id, uniqueness: {
    scope: :tweet_id,
    message: "は同じ投稿に２回以上いいねできません"
  }
end
