require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
    before(:each) do
        @user_1 = User.create!(
            name: 'Name',
            photo: 'Photo',
            bio: 'MyText',
            posts_counter: 2
        )
        @user_2 = User.create!(
            name: 'Name2',
            photo: 'Photo2',
            bio: 'MyText2',
            posts_counter: 0,
        )
        @post_1 = Post.create!(
            title: 'Title1',
            text: 'MyText1',
            comments_counter: 3,
            likes_counter: 1,
            author: @user_1
        )
        @post_2 = Post.create!(
            title: 'Title2',
            text: 'MyText2',
            comments_counter: 0,
            likes_counter: 0,
            author: @user_1
        )
        @comment_1 = Comment.create!(
            text: 'MyComment1',
            post: @post_1,
            author: @user_2
        )
        @comment_2 = Comment.create!(
            text: 'MyComment2',
            post: @post_1,
            author: @user_2
        )
        @comment_3 = Comment.create!(
            text: 'MyComment3',
            post: @post_1,
            author: @user_2
        )

        visit user_post_path(@user_1.id, @post_1.id)
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