class ChageDataImageTweets < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :image, :string
  end
end
