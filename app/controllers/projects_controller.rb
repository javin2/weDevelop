class ProjectsController < ApplicationController
	before_action :set_project, only: [:edit, :update, :destroy]

  def show
    if current_developer
      @project = current_developer.projects.find(params[:id])
      @project_members = @project.project_members
      @notes = @project.notes.order(created_at: :desc)
    elsif current_client
      @project = Project.find(params[:id])
      @project_members = @project.project_members
      @notes = @project.notes.order(created_at: :desc)
    else
      404
    end

    respond_to do |format|
      format.html
      format.js

    end
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
  			format.html {redirect_to @project, notice: "Your project was successfully created!"}
  		else
  			format.html {render :new, status: :unprocessable_entity}
  		end
  	end

  end

  def update

    old_completion_date = @project.projected_completion
    old_percentage = @project.percent_complete
    old_balance = @project.balance

    respond_to do |format|
      if @project.update(project_params)
        create_update_with_change(old_completion_date, old_percentage, old_balance)
        format.html {redirect_to @project, notice: "Updated Successfully"}
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
  end


  private

  	# Please, NOBODY touch these functions, one will cause a huge mess in app flow and the other is for security (meant to prevent attackers from injecting whatever they want into the database)

  	def set_project
  		@project = current_developer.projects.find(params[:id])
  	end



  	def project_params
  		params.require(:project).permit(:projected_completion, :title, :description, :percent_complete, :balance, note_attributes: [:id, :developer_id, :title, :body])
  	end

    # Method to create an update when the developer modifies one of the project details (ensures that the client doesn't go unaware when critical details are changed)

    def create_update_with_change(old_completion_date, old_percentage, old_balance)
      if @project.projected_completion != old_completion_date
        @project.notes.create(project_id: @project, developer_id: current_developer.id, title: "Projected Completion Date Updated By #{current_developer.first_name}", body: "The Project's projected completion date was changed from #{old_completion_date} to #{@project.projected_completion} by #{current_developer.first_name}")
      elsif @project.percent_complete != old_percentage
        @project.notes.create(project_id: @project, developer_id: current_developer.id, title: "Project Completion Percentage Updated By #{current_developer.first_name}", body: "The Project's completion percentage was updated from #{old_percentage} percent complete to #{@project.percent_complete} percent complete by #{current_developer.first_name}")
      elsif old_balance != @project.balance
        @project.notes.create(project_id: @project, developer_id: current_developer.id, title: "Project Balance Updated By #{current_developer.first_name}", body: "The Project's Balance date was changed from #{old_balance} to #{@project.balance} by #{current_developer.first_name}")
      else

      end
    end
  
end
