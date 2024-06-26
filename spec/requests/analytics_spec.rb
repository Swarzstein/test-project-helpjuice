require 'rails_helper'

RSpec.describe "Analytics", type: :request do
  let!(:current_user) { User.create(name: 'Akai', email: 'akai123@gmail.com') }

  describe "GET /analytics" do
    context "when user is not logged in" do
      it "returns http redirect" do
        get analytics_path
        expect(response).to have_http_status(:redirect)
      end
    end

    context "when user is logged in" do
      before do
        post login_path
      end

      it "returns http success" do
        get analytics_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
