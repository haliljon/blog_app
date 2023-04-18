require 'rails_helper'

RSpec.describe 'user/index', type: :feature do
    before(:each) do
        @user_1 = User.create!(
                 name: 'Name1',
                 photo: 'Photo1',
                 bio: 'MyText1',
                 posts_counter: 2
                 )
        @user_2 = User.create!(
                 name: 'Name2',
                 photo: 'Photo2',
                 bio: 'MyText2',
                 posts_counter: 2
                 )
        visit root_path
    end
    
    it 'See the username of all users' do
        expect(page).to have_content('Name1')
        expect(page).to have_content('Name2')
    end        

    it 'Shows the profile picture for each user' do
        expect(page).to have_css("img[src*='Photo1']")
        expect(page).to have_css("img[src*='Photo2']")
    end

    it 'Shows the number of posts written by each user' do
        expect(page).to have_content('2')
    end

    it 'Redirects to the user’s profile page when the user name is clicked' do
        click_link('Name1')
        expect(page).to have_current_path(user_path(@user_1))
    end
end