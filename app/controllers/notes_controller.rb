class NotesController < ApplicationController
  before_action :authenticate_developer!, only: [:create, :new]

  def show
  	
  end

  def new

  end

  def create
  	@project = current_developer.projects.find(params[:project_id])
  	@note = @project.notes.new(note_params)
  	@note.project = @project 
  	@note.developer = current_developer

  	respond_to do |format|
  		if @note.save
  			format.html {redirect_to @project, notice: 'Your update was created successfully!'}
  		else
  			format.html {render @project, status: :unprocessable_entity}
  		end
  	end
  end


  private

  	def note_params
  		params.require(:note).permit(:title, :body, :project_id, :developer_id)
  	end

end
