require 'rails_helper'

RSpec.describe "Searches", type: :system do
    let!(:current_user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com') }

    before :each do
        visit login_path
        click_button 'Log In'
        current_user = User.first
    end

    describe "Database register" do
        scenario "has only one search" do
            fill_in 'search-input', with: 'test'
            sleep 0.6
            fill_in 'search-input', with: 'testing s'
            sleep 0.6
            fill_in 'search-input', with: 'testing search'
            sleep 0.6
            
        end
    end

end