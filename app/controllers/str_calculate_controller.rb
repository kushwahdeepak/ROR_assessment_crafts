class StrCalculateController < ApplicationController
	protect_from_forgery with: :null_session # This allows POST requests without CSRF tokens

    def add
      begin
        numbers = params[:numbers]
        result = Calculate(numbers)
        render json: { result: result }
      rescue => e
        render json: { error: e.message }, status: :bad_request
      end
    end

    def Calculate(numbers)
        return 0 if numbers.empty?
    
        coma_seprate = ","
        numbers = numbers.gsub("\n", coma_seprate)
        nums = numbers.split(coma_seprate).map(&:to_i)
    
        negatives = nums.select { |n| n < 0 }
        raise "negative numbers not allowed: #{negatives.join(',')}" unless negatives.empty?
    
        nums.sum
    end

end
