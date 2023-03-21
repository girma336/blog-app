require 'rails_helper'

RSpec.describe 'Users Show Page', type: :feature do
    let(:user_ids) { User.pluck(:id) }
    # let(:user) { User. }
    # let(:post) { Post.all }
    describe 'Show Page' do
    it 'I can see the user\'s profile picture.' do # 1
      visit user_path(user_ids.last)
      expect(page).to have_selector('img')
    end

    it 'shows the user name' do # 2
      visit user_path(user_ids.last)
      expect(page).to have_content('Tom')
    end

    it 'shows the Number of Posts' do # 3
      visit user_path(user_ids.last)
      expect(page).to have_content('Number of Post:')
    end

    it 'I can see the user\'s bio.' do # 4
      visit user_path(user_ids.last)
      expect(page).to have_content('Teacher from Mexico.')
    end

    it 'I can see the user\'s first 3 posts.' do # 5
      visit user_path('24')
      expect(page).not_to have_content('new post')
      expect(page).not_to have_content('this is my last post')
    end

    it 'I can see a button that lets me view all of a user\'s posts.' do # 6
      visit user_path(user_ids.last)
      expect(page).to have_content('Details Asbout User')
    end

    it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do # 8
      visit user_path(user_ids.last)
      click_link 'See all posts'
      expect(page).to have_current_path('/users/3471/posts')
    end
  end
end