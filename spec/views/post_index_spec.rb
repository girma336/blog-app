require 'rails_helper'

RSpec.describe 'Posts Index Page', type: :feature do
  let(:user_ids) { User.pluck(:id) }
  let(:pots1) { Post.first }
  before do
    visit user_posts_path(user_id: user_ids.last)
  end
  describe 'index page' do
    it 'I can see the user\'s profile picture.' do # 1
      visit user_posts_path(user_id: user_ids.last)
      expect(page).to have_selector('img')
    end

    it 'shows the user name' do # 2
      visit user_posts_path(user_ids.last)
      expect(page).to have_content('Tom')
    end

    it 'shows the nuber of posts user wrote' do # 3
      visit user_posts_path(user_ids.last)
      expect(page).to have_content('Number of Post:')
    end

    it 'I can see a post\'s title.' do # 4
      visit user_posts_path(user_ids.last)
      expect(page).to have_content('1')
    end
    
    it 'I can see a section for pagination if there are more posts than fit on the view.' do # 9
      expect(page).to have_content('Pagination')
    end
  end
end