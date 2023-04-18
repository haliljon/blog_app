require 'rails_helper'

RSpec.describe 'post/index', type: :feature do
    before(:each) do
        @user= User.create!(
            name: 'Name1',
            photo: 'Photo1',
            bio: 'MyText1',
            posts_counter: 2,
            )
        @post_1 = Post.create!(
            title: 'Title1',
            text: 'MyText1',
            comments_counter: 3,
            likes_counter: 0,
            author: @user
            )
        @post_2 = Post.create!(
            title: 'Title2',
            text: 'MyText2',
            comments_counter: 0,
            likes_counter: 0,
            author: @user
            )
        @comment_1 = Comment.create!(
            text: 'MyComment1',
            post: @post_1,
            author: @user
            )
        @comment_2 = Comment.create!(
            text: 'MyComment2',
            post: @post_1,
            author: @user
            )
        @comment_3 = Comment.create!(
            text: 'MyComment3',
            post: @post_1,
            author: @user
            )
        visit user_posts_path(@user.id)
    end

    it 'Show the profile picture' do
        expect(page).to have_xpath("//img[@src='Photo1']")
    end

    it 'Show the username' do
        expect(page).to have_content('Name1')
    end

    it 'Show the number of posts written by the user' do
        expect(page).to have_content('2')
    end

    it 'Show the post title' do
        expect(page).to have_content('Title1')
        expect(page).to have_content('Title2')
    end

    it 'Show the post body' do
        expect(page).to have_content('MyText1')
        expect(page).to have_content('MyText2')
    end

    it 'Show the first comment on a post' do
        expect(page).to have_content('MyComment1')
    end

    it 'Show the number of comments on a post' do
        expect(page).to have_content('3')
    end

    it 'Show the number of likes on a post' do
        expect(page).to have_content('0')
    end

    it 'Show the button Pagination' do
        expect(page).to have_content('Pagination')
    end

    it 'When the user clicks on the post title, it redirects to the post’s page' do
        click_on 'Title1'
        expect(page).to have_current_path user_post_path(@post_1.author_id, @post_1)
    end
end

