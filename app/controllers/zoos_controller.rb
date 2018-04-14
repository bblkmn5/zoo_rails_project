# Controller for Zoo views
class ZoosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_zoo, only: %i[show edit update destroy]
  before_action :user_is_current_user, only: %i[show edit update destroy]

  def other_zoo
    @zoos = Zoo.all_except(current_user.zoos)
  end

  # def index
  #     @zoos = Zoo.all
  # end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @zoo }
    end
  end

  def new
    @zoo = Zoo.new
    @zoo.keepers.build
    @zoo.animals.build
  end

  def create
    @zoo = Zoo.new(zoo_params)
    @zoo.user_id = current_user.id
    if @zoo.save
      flash[:notice] = "Successfully added #{@zoo.name}."
      redirect_to user_zoo_path(current_user, @zoo)
    elsif Zoo.where(name: @zoo.name).exists?
      flash[:error] = 'That Zoo already exists!'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'You need to fill out everything in the form!'
      redirect_to new_user_zoo_path(current_user)
    end
  end

  def edit; end

  def update
    if @zoo.update(zoo_params)
      flash[:notice] = "Successfully updated #{@zoo.name}."
      redirect_to user_zoo_path(current_user, @zoo)
    elsif Zoo.where(name: @zoo.name).exists?
      flash[:error] = 'That Zoo already exists!'
      redirect_to edit_user_zoo_path(current_user, @zoo)
    else
      flash[:error] = 'Hm.. Something went wrong'
      redirect_to edit_user_zoo_path(current_user, @zoo)
    end
  end

  def destroy
    Animal.where(zoo_id: @zoo.id).delete_all
    Keeper.where(zoo_id: @zoo.id).delete_all
    @zoo.delete
    flash[:alert] = "After much consideration, you have decided to cut off ties with #{@zoo.name} and all of its inhabitants."
    redirect_to user_path(current_user)
  end

  private

  def set_zoo
    @zoo = Zoo.find(params[:id])
  end

  def zoo_params
    params.require(:zoo).permit(:name, :animal_capacity, :keeper_capacity, animals_attributes: %i[name species personality zoo_id], keepers_attributes: %i[name zoo_id])
  end
end
