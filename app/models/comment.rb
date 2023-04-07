class Comment < ApplicationRecord
  belongs_to :author, class_name: :User
  belongs_to :post, class_name: :Post

  def increase_comment_counter
    post.comments_counter += 1
    post.save
  end
end
