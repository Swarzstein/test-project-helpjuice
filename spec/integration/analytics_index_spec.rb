require 'rails_helper'

RSpec.describe "Analytics#index", type: :system, js: true do
let!(:current_user) { User.create(name: 'Akai', email: 'akaiisred@gmail.com') }
let!(:search) { Search.create([
  {query: 'Linkin Park', user_id: current_user.id},
  {query: 'Lazerpunk', user_id: current_user.id},
  {query: 'Juno Reactor', user_id: current_user.id},
  {query: 'Eluveitie', user_id: current_user.id},
  {query: 'Limp Bizkit', user_id: current_user.id},
  {query: 'Eluveitie', user_id: current_user.id},
  {query: 'Linkin Park', user_id: current_user.id},
  {query: 'Lazerpunk', user_id: current_user.id},
  {query: 'Juno Reactor', user_id: current_user.id},
  {query: 'Limp Bizkit', user_id: current_user.id},
  {query: 'Linkin Park', user_id: current_user.id},
  {query: 'Lazerpunk', user_id: current_user.id},
  {query: 'Juno Reactor', user_id: current_user.id},
  {query: 'Eluveitie', user_id: current_user.id},
  {query: 'Juno Reactor', user_id: current_user.id},
  {query: 'Linkin Park', user_id: current_user.id},
  {query: 'Juno Reactor', user_id: current_user.id},
  {query: 'Linkin Park', user_id: current_user.id},
  {query: 'Metallica', user_id: current_user.id},
  {query: 'Lazerpunk', user_id: current_user.id},
  {query: 'Linkin Park', user_id: current_user.id}
  ])}

  before do
    driven_by(:selenium_chrome_headless)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    allow_any_instance_of(ApplicationController).to receive(:require_user).and_return(true)
  end

  describe "analytics/index view" do
    it "displays the 5 most searched queries" do
      visit analytics_path
      expect(page).to have_content('Linkin park')
      expect(page).to have_content('Lazerpunk')
      expect(page).to have_content('Juno reactor')
      expect(page).to have_content('Eluveitie')
      expect(page).to have_content('Limp bizkit')
      expect(page).not_to have_content('Metallica')
    end
  end
end