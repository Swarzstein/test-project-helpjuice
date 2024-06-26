require 'rails_helper'

RSpec.describe AnalyticsController, type: :controller do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com') }
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
    allow(controller).to receive(:current_user).and_return(current_user)
    allow(controller).to receive(:require_user).and_return(true)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
          
    it "returns the 5 most searched queries" do
      get :index
      expect(assigns(:top_searches).count).to eq(5)
      expect(assigns(:top_searches)).to include('Linkin Park')
      expect(assigns(:top_searches)).to include('Limp Bizkit')
      expect(assigns(:top_searches)).to include('Lazerpunk')
      expect(assigns(:top_searches)).to include('Juno Reactor')
      expect(assigns(:top_searches)).to include('Eluveitie')
      expect(assigns(:top_searches)).not_to include('Metallica')
    end

    it "returns the 5 most searched queries that match the filter" do
      get :index, params: { query: 'li' }
      expect(assigns(:filtered_searches).count).to eq(3)
      expect(assigns(:filtered_searches)).to include('Linkin Park')
      expect(assigns(:filtered_searches)).to include('Limp Bizkit')
      expect(assigns(:filtered_searches)).not_to include('Lazerpunk')
      expect(assigns(:filtered_searches)).not_to include('Juno Reactor')
      expect(assigns(:filtered_searches)).not_to include('Eluveitie')
      expect(assigns(:filtered_searches)).to include('Metallica')
    end
  end
end