require 'rails_helper'

RSpec.describe "Searches#index", type: :system, js: true do
  let!(:current_user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com') }
  let!(:search) { Search.create(query: 'emil lasaria', user_id: current_user.id) }

  before do
    driven_by(:selenium_chrome_headless)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end

  describe "index view" do
    it "adds new searches" do
      visit root_path
      fill_in 'search-input', with: 'What is'
      sleep 1
      fill_in 'search-input', with: 'What is a'
      sleep 1
      fill_in 'search-input', with: 'What is a good car'
      sleep 1
      expect(page).to have_selector('#search-results li', text: 'what is a good car', wait: 10)
      fill_in 'search-input', with: 'How is'
      sleep 1
      fill_in 'search-input', with: 'How is emil hajric'
      sleep 1
      fill_in 'search-input', with: 'How is emil hajric doing'
      sleep 1
      expect(page).to have_content('how is emil hajric doing', wait: 10)
      expect(page).to have_content('emil lasaria')
      expect(page).to have_content('what is a good car')
      expect(all('#search-results li').count).to eq(7)
      visit searches_path
      expect(all('#search-results li').count).to eq(3)
    end

    it "does not add empty searches" do
      visit root_path
      fill_in 'search-input', with: 'Link'
      sleep 1
      fill_in 'search-input', with: ''
      sleep 1
      expect(all('#search-results li').count).to eq(2)
    end
  end
end