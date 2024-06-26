require 'rails_helper'
require 'spec_helper'

RSpec.describe "Searches", type: :request do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com') }

  describe "GET /index" do
    context "when user is not logged in" do
      it "returns http redirect when user is not logged in" do
        get searches_path
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when user is logged in" do
      before do
        post login_path
      end

      it "returns http success when user is logged in" do
        get searches_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
