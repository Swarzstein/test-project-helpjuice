require 'rails_helper'

RSpec.describe "sessions#new", type: :system do
    let!(:user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com') }

    describe "sessions/new view" do
        it "displays the login form" do
            visit login_path
            expect(page).to have_content('Log In')
            click_button 'Log In'
            expect(page).to have_content('Akai')
        end
    end
end