class Like < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post, class_name: :Post

  def increase_like_counter
    post.likes_counter += 1
    post.save
  end
end
