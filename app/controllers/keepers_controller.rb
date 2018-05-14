# Controller for keeper views
class KeepersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_keeper, only: %i[show edit update destroy]
  before_action :user_is_current_user, only: %i[show edit update destroy]
  before_action :set_zoo, only: %i[show edit update]

  def index
    @keepers = Keeper.all
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @keeper, status: 200 }
    end
  end

  def new
    @keeper = Keeper.new
  end

  def create
    @keeper = Keeper.new(keeper_params)

    if zoo_spaces_full?
      flash[:error] = 'That Zoo cannot have anymore keepers! Please choose a different zoo.'
      redirect_to new_user_keeper_path
    elsif @keeper.save
      flash[:notice] = "Successfully added #{@keeper.name}."
      redirect_to user_zoo_path(current_user, @keeper.zoo)
    else
      flash[:error] = 'Something went wrong. Please try again.'
      redirect_to new_user_keeper_path
    end
  end

  def edit; end

  def update
    if zoo_spaces_full?
      flash[:error] = 'That Zoo cannot have anymore keepers! Please choose a different zoo.'
      redirect_to edit_user_keeper_path(current_user, @keeper)
    elsif @keeper.update(keeper_params)
      flash[:notice] = "Successfully updated #{@keeper.name}"
      redirect_to user_keeper_path(current_user, @keeper)
    else
      redirect_to edit_user_keeper_path(current_user, @keeper)
    end
  end

  def destroy
    @keeper.delete
    flash[:alert] = "After much consideration, you have decided to lay off #{@keeper.name}. Goodbye #{@keeper.name}!"
    redirect_to user_keepers_path(:zoo_id)
  end

  private

  def set_keeper
    @keeper = Keeper.find(params[:id])
  end

  def set_zoo
    @zoo = Zoo.find_by(id: params[:id])
  end

  def zoo_spaces_full?
    zoo = Zoo.find_by(id: @keeper.zoo_id)
    zoo.keeper_capacity == zoo.keepers.count
  end

  def keeper_params
    params.require(:keeper).permit(:name, :zoo_id)
  end
end
