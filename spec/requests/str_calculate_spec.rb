require 'rails_helper'

RSpec.describe "StrCalculateController", type: :request do
  describe "POST #add" do
    it "return 0 for empty string" do
      post '/str_calculate/add', params: { numbers: "" }
      expect(response.body).to eq("{\"result\":0}")
    end

    
  end
end
