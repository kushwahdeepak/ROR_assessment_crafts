require 'rails_helper'

RSpec.describe "StrCalculateController", type: :request do
  describe "POST #add" do
    it "return 0 for empty string" do
      post '/str_calculate/add', params: { numbers: "" }
      expect(response.body).to eq("0")
    end

    it "rais exception for negative numbers" do
      post '/str_calculate/add', params: { numbers: "1,-2" }
      expect(response.status).to eq(400)
      expect(response.body).to eq("negative numbers not allowed: -2")
    end
   
    it "rais exception for multiple negative numbers" do
      post '/str_calculate/add', params: { numbers: "1,-2,-3" }
      expect(response.status).to eq(400)
      expect(response.body).to eq("negative numbers not allowed: -2,-3")
    end
    
  end
end
