class DevelopersController < ApplicationController

  def dashboard
  	@projects = current_developer.projects
  end
  
end
