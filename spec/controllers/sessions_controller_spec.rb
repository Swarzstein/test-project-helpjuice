require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com') }
  
  describe "POST #create" do
    it "logs in the user" do
      post :create
      expect(session[:user_id]).to eq(current_user.id)
    end
  end

  describe "DELETE #destroy" do
    before do
      post :create
    end
    
    it "logs out the user" do
      delete :destroy
      expect(session[:user_id]).to be_nil
    end
  end
end