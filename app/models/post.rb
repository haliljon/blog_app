class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  def increase_post_counter
    user.posts_counter += 1
    user.save
  end

  def last_5_comments
    comments.last(5)
  end
end
