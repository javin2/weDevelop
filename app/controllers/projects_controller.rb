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
  	@project.developer_id = current_developer.id
  	# @project.project_members.new(developer: current_developer)

  	respond_to do |format|
  		if @project.save
  			format.html {redirect_to developer_root_path, notice: "Your project was successfully created!"}
  		else
  			format.html {render :new, status: :unprocessable_entity}
  		end
  	end

  end

  def update
  end

  def destroy
  end


  private

  	# Please, NOBODY touch these functions, one will cause a huge mess in app flow and the other is for security (meant to prevent attackers from injecting whatever they want into the database)

  	def set_project
  		@project = current_developer.projects.find(params[:id])
  	end

  	def project_params
  		params.require(:project).permit(:projected_completion, :title, :description, :percent_complete, :balance)
  	end
  
end
