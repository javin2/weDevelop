class ApplicationController < ActionController::Base



	protected

	def authenticate_inviter!
		authenticate_developer!(force: true)
	end


end
