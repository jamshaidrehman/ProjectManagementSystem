module Manager
  class CommentsController < ApplicationController
    before_action :find_project
    before_action :authenticate_user!

    def create
      @comment = @project.comments.new(comment_params.merge(user_id: current_user.id))
    end

    def destroy
      @comment = Comment.find params[:id]

      if @comment.destroy
        flash[:notice] = "Your Comment is successfully deleted."
      else
        flash[:error] = @comment.errors.full_messages.to_sentence
      end

      redirect_to manager_project_path(@project)
    end

    private
    
    def comment_params
      params.require(:comment).permit(:body, :project_id, :user_id)
    end

    def find_project
      @project = Project.find params[:project_id]
    end
  end
end
