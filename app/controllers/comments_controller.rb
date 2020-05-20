class CommentsController < ApplicationController
before_action :set_topic

  def new
    @comment = Comment.new
  end

  def create
    @comment = @topic.comments.new(comment_params)
    if @comment.save
      redirect_to sub_topic_path(@topic.sub_id, @topic)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:author, :body)
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
