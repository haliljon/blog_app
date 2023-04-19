require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
  before(:each) do
    @user1 = User.create!(
      name: 'Name',
      photo: 'Photo',
      bio: 'MyText',
      posts_counter: 2
    )
    @user2 = User.create!(
      name: 'Name2',
      photo: 'Photo2',
      bio: 'MyText2',
      posts_counter: 0
    )
    @post1 = Post.create!(
      title: 'Title1',
      text: 'MyText1',
      comments_counter: 3,
      likes_counter: 1,
      author: @user1
    )
    @post2 = Post.create!(
      title: 'Title2',
      text: 'MyText2',
      comments_counter: 0,
      likes_counter: 0,
      author: @user1
    )
    @comment1 = Comment.create!(
      text: 'MyComment1',
      post: @post1,
      author: @user2
    )
    @comment2 = Comment.create!(
      text: 'MyComment2',
      post: @post1,
      author: @user2
    )
    @comment3 = Comment.create!(
      text: 'MyComment3',
      post: @post1,
      author: @user2
    )

    visit user_post_path(@user1.id, @post1.id)
  end

  it 'Show the post title' do
    expect(page).to have_content('Title1')
  end

  it 'Show the post author' do
    expect(page).to have_content('Name')
  end

  it 'Show the number of comments' do
    expect(page).to have_content('3')
  end

  it 'Show the number of likes' do
    expect(page).to have_content('1')
  end

  it 'Show the post body' do
    expect(page).to have_content('MyText1')
  end

  it 'Show the comment author' do
    expect(page).to have_content('Name2')
  end

  it 'Show the comment body' do
    expect(page).to have_content('MyComment1')
    expect(page).to have_content('MyComment2')
    expect(page).to have_content('MyComment3')
  end
end
