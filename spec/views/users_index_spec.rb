require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  let(:user1) { User.last }
  before do
      visit users_path
  end 
  scenario 'Displays name, profile picture, and post count for all users' do
    sleep(1)
    expect(page).to have_content("List of User's")
    # expect(page).to have_ta("img[src='https://qph.cf2.quoracdn.net/main-thumb-678760058-200-nbzsylvtrbqrbodrdjcjbcwqfxkpbrcf.jpeg']")
    # expect(page).to have_css('.text-muted float-left', text: 'Number of posts: 0')
    # expect(page).to have_css('li.user', count: 4)
  end
  describe 'index page' do
    it 'shows the user name' do
      visit users_path
      expect(page).to have_content('Girma')
    end

    it 'shows the user profile picture' do
      visit users_path
      expect(page).to have_selector('img')
    end

    it 'Can see the number of posts each user has written' do
      visit users_path
      expect(page).to have_content('Number of Post: ')
    end
  end
end