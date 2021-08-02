module Manager
  class CommentsController < ApplicationController
    before_action :find_project
    before_action :authenticate_user!

    def create
      @comment = @project.comments.new(comment_params)
      @comment.user_id = current_user.id
      @comment.save
    end

    def destroy
      @comment = Comment.find params[:id]

      if @comment.destroy
        flash[:notice] = "Your Comment is successfully deleted"
      else
        flash[:notice] = "Your Comment is not deleted"
      end
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
