class DevelopersController < ApplicationController
	before_action :authenticate_developer!


  def dashboard
  	@projects = current_developer.projects
  end

  def client_details
  	@projects = current_developer.projects
  end
  
end
