require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'John Doe', photo: 'https://some.image.com', bio: 'Some bio', posts_counter: 0)
  subject do
    Post.new(title: 'My first post', text: 'Some text', author_id: user.id, comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 255
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = 1.3
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = 3.7
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to zero' do
    subject.likes_counter = -2
    expect(subject).to_not be_valid
  end
end
