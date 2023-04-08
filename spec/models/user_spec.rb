require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', photo: 'https://some.image.com', bio: 'Some bio', posts_counter: 1) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 2.3
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be numeric' do
    subject.posts_counter = 'a'
    expect(subject).to_not be_valid
  end

  it '#last_3_post should return the last 3 posts' do
    post1 = Post.new(title: 'My first post', text: 'Some text', author_id: subject.id, comments_counter: 0,
                     likes_counter: 0)
    post2 = Post.new(title: 'My second post', text: 'Some text', author_id: subject.id, comments_counter: 0,
                     likes_counter: 0)
    post3 = Post.new(title: 'My third post', text: 'Some text', author_id: subject.id, comments_counter: 0,
                     likes_counter: 0)
    post4 = Post.new(title: 'My fourth post', text: 'Some text', author_id: subject.id, comments_counter: 0,
                     likes_counter: 0)
    post5 = Post.new(title: 'My fifth post', text: 'Some text', author_id: subject.id, comments_counter: 0,
                     likes_counter: 0)
    post6 = Post.new(title: 'My sixth post', text: 'Some text', author_id: subject.id, comments_counter: 0,
                     likes_counter: 0)
    post1.save
    post2.save
    post3.save
    post4.save
    post5.save
    post6.save
    expect(subject.last_3_post).to eq([post6, post5, post4])
  end
end
