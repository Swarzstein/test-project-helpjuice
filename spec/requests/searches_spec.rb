require 'rails_helper'
require 'spec_helper'

RSpec.describe "Searches", type: :request do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com') }

  describe "GET /index" do
    it "returns http redirect when user is not logged in" do
      get searches_path
      expect(response).to have_http_status(:redirect)
    end
  end
end
