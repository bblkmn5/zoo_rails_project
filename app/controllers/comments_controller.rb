# Feature added to zookeepers
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show destroy]
  before_action :set_animal

  def index
    @comments = @animal.comments
    respond_to do |format|
      format.html {render :index }
      format.json {render json: @comments}
    end
  end

  def show; end

  def new
    @comment = Comment.new(animal_id: @animal.id)
  end

  def create
    @comment = @animal.comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @animal }
        format.json { render json: @comment }
      end
      #  redirect_to user_animal_path(current_user, @animal)
    else
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to user_animal_path(current_user, @animal.id)
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'Comment deleted'
    redirect_to user_animal_path(current_user, @animal)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_animal
    @animal = Animal.find_by(id: params[:animal_id])
  end

  def comment_params
    params.require(:comment).permit(:notes, :animal_id)
  end
end
