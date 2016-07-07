require 'rails_helper'

RSpec.describe "Killmails", type: :request do
  describe "GET /killmails" do
    it "works! (now write some real specs)" do
      get killmails_path
      expect(response).to have_http_status(200)
    end
  end
end
