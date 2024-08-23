require 'rails_helper'

RSpec.describe 'User Discover Page, Discover Index', type: :feature do
  describe 'When a user visits the path "/users/:id/discover" they see: ' do
    before(:each) do
      @user_1 = User.create!(name: 'Sam', email: 'sam_t@email.com')
      @user_2 = User.create!(name: 'Tommy', email: 'tommy_t@gmail.com')
    end

    it 'a Button to Discover Top Rated Movies' do
      visit user_discover_index_path(@user_1)

      expect(page).to have_selector(:link_or_button, 'Discover Top Rated Movies')
    end

    it 'a text field to enter keyword(s) to search by movie title and a button to search by movie title' do
      visit user_discover_index_path(@user_1)

      expect(page).to have_content("Search by movie title")
      expect(page).to have_selector(:link_or_button, 'Search by Movie Title')
    end
  end
end
