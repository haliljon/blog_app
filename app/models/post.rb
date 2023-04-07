class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  after_save :increase_post_counter

  def increase_post_counter
    author.increment!(:posts_counter)
  end

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end
end
