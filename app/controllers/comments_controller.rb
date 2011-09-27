# encoding: utf-8
class CommentsController < ApplicationController
  def create
    @look = Look.find(params[:look_id])
    @comment = @look.comments.new(params[:comment])
    if @comment.save 
      flash[:success] = 'Комментарий добавлен!'
    else
      flash[:error] = 'Вы забыли написать текст комментария!'      
    end
    redirect_to look_path(@look)
  end
end