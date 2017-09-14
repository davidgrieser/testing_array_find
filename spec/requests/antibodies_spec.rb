require 'rails_helper'

RSpec.describe "Antibodies", type: :request do
  describe "GET /antibodies" do
    it "works! (now write some real specs)" do
      get antibodies_path
      expect(response).to have_http_status(200)
    end
  end
end
