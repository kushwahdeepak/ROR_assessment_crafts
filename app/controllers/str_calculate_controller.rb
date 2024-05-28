class StrCalculateController < ApplicationController
	protect_from_forgery with: :null_session # This allows POST requests without CSRF tokens

	def add
			numbers = params[:numbers]
			return 0 if numbers.empty?
			render json: { result: "this is for test" }
	end

end
