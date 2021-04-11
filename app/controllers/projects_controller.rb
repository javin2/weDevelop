class ProjectsController < ApplicationController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  	@project = Project.new
  end

  def edit
  end

  def create
  	@project = Project.new(project_params)
  	@project.project_members.new(developer: current_developer)
  end

  def update
  end

  def destroy
  end


  private

  	def set_project
  		@project = Project.find(params[:id])
  	end

  	def project_params
  		params.require(:project).permit(:projected_completion, :title, :description, :percent_complete, :balance)
  	end
  
end
