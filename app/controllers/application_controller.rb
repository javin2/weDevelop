class ApplicationController < ActionController::Base


	private
		def after_sign_in_path_for(developers)
		 developers_path
		end

		def after_sign_in_path_for(clients)
			clients_path
		end
end
