class ConversationsController < ApplicationController
  

 

  # GET /conversations/1 or /conversations/1.json
  def show
    @conversation = Conversation.find_by(project_id: params[:project_id])
    @messages = @conversation.messages.order(created_at: :desc)
    @project = Project.find(params[:project_id])
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
  end

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations or /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)

    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(:project_id)
    end
end
