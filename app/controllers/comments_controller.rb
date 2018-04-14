# Feature added to zookeepers
class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    render json: @comment, status: 200
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.keeper_id = @comment.animal.zoo.keepers.first.id
    if @comment.save
      flash[:notice] = 'Successfully added comment.'
      redirect_to user_animal_path(current_user, @comment.animal_id)
    else
      flash[:error] = 'Nope.'
      redirect_to user_animal_path(current_user, @animal.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:notes, :animal_id)
  end
end
