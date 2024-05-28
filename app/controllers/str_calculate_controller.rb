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
end

end
