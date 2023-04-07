class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post, class_name: :Post

  after_save :increase_like_counter

  def increase_like_counter
    post.increment!(:likes_counter)
  end
end
