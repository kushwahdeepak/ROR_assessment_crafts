require 'rails_helper'

RSpec.describe "StrCalculateController", type: :request do
  describe "POST #add" do
    it "return 0 for empty string" do
      post '/str_calculate/add', params: { numbers: "" }
      expect(JSON.parse(response.body)['error']).to eq(0)
    end

    it "rais exception for negative numbers" do
      post '/str_calculate/add', params: { numbers: "1,-2" }
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['error']).to eq("negative numbers not allowed: -2")
    end
   
    it "rais exception for multiple negative numbers" do
      post '/str_calculate/add', params: { numbers: "1,-2,-3" }
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['error']).to eq("negative numbers not allowed: -2,-3")
    end

    it "return the number for a single number string" do
      post '/str_calculate/add', params: { numbers: "1" }
      expect(JSON.parse(response.body)['error']).to eq(1)
    end

    it "return sum of two numbers" do
      post '/str_calculate/add', params: { numbers: "1,2" }
      expect(JSON.parse(response.body)['error']).to eq(3)
    end

    it "return sum of multiple numbers" do
      post '/str_calculate/add', params: { numbers: "1,2,3" }
      expect(JSON.parse(response.body)['error']).to eq(6)
    end
    
  end
end
