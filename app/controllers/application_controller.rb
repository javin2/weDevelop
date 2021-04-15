class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?


	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :phone, :rate, :company_name])
	end

	def authenticate_inviter!
		authenticate_developer!(force: true)
	end


end
