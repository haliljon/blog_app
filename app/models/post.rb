class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments, foreign_key: :post_id
  has_many :likes, foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_5_comments
    comments.order(created_at: :desc).limit(5)
  end

  after_save :increase_post_counter

  def increase_post_counter
    author.increment!(:posts_counter)
  end
end
