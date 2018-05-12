# Feature added to zookeepers
class CommentsController < ApplicationController
  before_action :set_animal
  def index
    @comments = @animal.comments
    
    respond_to do |format|
      format.html {render 'index.html', layout: false}
      format.js {render 'index.js', layout: false}
    end
    #  render json: @comment, status: 200
  end

  def show
    @comment = Comment.find(params[:id])
  end


  def new
    @comment = Comment.new
  end

  def create
    @comment = @animal.comments.build(comment_params)
    if @comment.save
      render 'comments/show', layout: false
      # render json: @comment, status: 201
      # redirect_to user_animal_path(current_user, @animal)
    else
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to user_animal_path(current_user, @animal.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'Comment deleted'
    redirect_to user_animal_path(current_user, @animal)
  end

  private

  def set_animal
    @animal = Animal.find_by(id: params[:animal_id])
  end

  def comment_params
    params.require(:comment).permit(:notes, :animal_id)
  end
end
