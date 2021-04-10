class ApplicationController < ActionController::Base


	private
		def after_sign_in_path_for(resource)
		 developers_index_path
		end
end
