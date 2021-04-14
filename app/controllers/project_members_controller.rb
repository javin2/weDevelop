class ProjectMembersController < ApplicationController
	before_action :set_project
	before_action :authenticate_developer!


def create
	new_project_member = @project.project_members.new(project_member_params)
	new_project_member.project = @project
	new_project_member.developer = current_developer
	new_project_member.assign_client

	if new_project_member.save
		redirect_to @project, notice: "Success"
	else
		redirect_to @project, alert: "Did Not Work"
	end
end



private
	
	def project_member_params
		params.require(:project_member).permit(:email)
	end

	def set_project
		@project = current_developer.projects.find(params[:project_id])
	end


end