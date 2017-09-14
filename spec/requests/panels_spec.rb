require 'rails_helper'

RSpec.describe "Panels", type: :request do
  describe "GET /panels" do
    it "works! (now write some real specs)" do
      get panels_path
      expect(response).to have_http_status(200)
    end
  end
end
