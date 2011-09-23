class CommentsController < ApplicationController
  def create
    @look = Look.find(params[:look_id])
    @comment = @look.comments.new(params[:comment])
    if @comment.save 
      flash[:success] = 'Comment added'
    else
      flash[:error] = @comment.errors.full_messages.collect { |msg| msg  }
      
    end
    redirect_to look_path(@look)
  end
end