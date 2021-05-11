class DevelopersController < ApplicationController
	before_action :authenticate_developer!


  def dashboard
  	@projects = current_developer.projects
  	@project_members = current_developer.project_members
  	@project = Project.new
  end

  def client_details
  	@projects = current_developer.projects
  end
  
end
