class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new comment_params
    @comment.user = current_user
    if @comment.save?
      redirect_to @project, notice: "added comment"
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
