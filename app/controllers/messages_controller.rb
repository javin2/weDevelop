class MessagesController < ApplicationController
  # before_action :set_message, only: %i[ show edit update destroy ]

  
  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  # def edit
  # end

  # POST /messages or /messages.json
  def create
    @project = Project.find(params[:project_id])
    @conversation = @project.conversation
    @message = @conversation.messages.new(message_params)
    if current_developer
      @message.developer_id = current_developer.id
    else
      @message.client_id = current_client.id 
    end

    
      if @message.save
        if current_client
          SiteMailer.notify_developer_new_message(current_client, @project.developer, @project).deliver_now
          redirect_to project_conversation_path, notice: "Message was successfully created." 
        else
          @project.project_members.each do |f|
            SiteMailer.notify_client_new_message(f.client, current_developer, @project).deliver_now
            
          end
          redirect_to project_conversation_path, notice: "Message was successfully created."
        end

      else
        render :new, status: :unprocessable_entity 
      end
    
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  # def update
  #   respond_to do |format|
  #     if @message.update(message_params)
  #       format.html { redirect_to @message, notice: "Message was successfully updated." }
  #       format.json { render :show, status: :ok, location: @message }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /messages/1 or /messages/1.json
  # def destroy
  #   @message.destroy
  #   respond_to do |format|
  #     format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:body, :developer_id, :client_id)
    end
end
