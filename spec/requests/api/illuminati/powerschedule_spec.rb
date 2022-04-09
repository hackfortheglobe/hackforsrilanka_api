require 'rails_helper'

RSpec.describe "Api::Illuminati::Powerschedules", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/illuminati/powerschedule/index"
      expect(response).to have_http_status(:success)
    end
  end

end
