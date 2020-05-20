class CommentsController < ApplicationController
before_action :set_topic

  def new
    @comment = Comment.new
  end

  private

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
