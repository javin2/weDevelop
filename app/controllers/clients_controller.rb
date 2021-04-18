class ClientsController < ApplicationController
	before_action :authenticate_client!


  def dashboard
  	@project_members = current_client.project_members
  end

  def show
  end

  def new
  end

  def edit
  end
end
