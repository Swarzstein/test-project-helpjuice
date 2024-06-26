require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com') }
  let!(:search) { Search.create([
    {query: 'Linkin Park', user_id: current_user.id}, 
    {query: 'Limp Bizkit', user_id: current_user.id}, 
    {query: 'Lazerpunk', user_id: current_user.id}, 
    {query: 'Linkin Park', user_id: current_user.id},
    {query: 'Metallica', user_id: current_user.id}, 
    {query: 'Linkin Park', user_id: current_user.id}, 
    {query: 'Lazerpunk', user_id: current_user.id}, 
    {query: 'Juno Reactor', user_id: current_user.id},
    {query: 'Eluveitie', user_id: current_user.id}, 
    {query: 'Extraterra', user_id: current_user.id}, 
    {query: 'Lazerpunk', user_id: current_user.id}, 
    {query: 'Linkin Park', user_id: current_user.id}
  ])}

  before do
    allow(controller).to receive(:current_user).and_return(current_user)
    allow(controller).to receive(:require_user).and_return(true)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
          
    it "returns only the last 10 searches" do
      get :index
      expect(assigns(:searches).count).to eq(10)
    end
  end
  
  describe "POST #create" do
    it "creates a new search" do 
      expect {
        post :create, params: { search: { query: 'search query' } }
      }.to change(Search, :count).by(1)
    end
    
    it "does not create a new search if the query is empty" do
      expect {
        post :create, params: { search: { query: '' } }
      }.to change(Search, :count).by(0)
    end
          
    it "creates a new search if the query is the same as the last search" do
      expect {
        post :create, params: { search: { query: 'Linkin Park' } }
      }.to change(Search, :count).by(1)
    end
          
    it "creates a new search if the query is different from the last search" do
      expect {
        post :create, params: { search: { query: 'Limp Bizkit' } }
      }.to change(Search, :count).by(1)
    end
          
    it "creates a new search if the last search is nil" do
      Search.destroy_all
      expect {
        post :create, params: { search: { query: 'Limp Bizkit' } }
      }.to change(Search, :count).by(1)
    end
    
    it "updates the last search if the query is completing the last search" do
      post :create, params: { search: { query: 'Limp' } }
      expect {
        post :create, params: { search: { query: 'Limp Bizkit' } }
      }.to change(Search, :count).by(0)
    end
  end
end