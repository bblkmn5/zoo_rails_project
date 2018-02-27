class KeepersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_keeper, only: [:show, :edit, :update, :destroy]
    before_action :user_is_current_user, only: [:show, :edit, :update, :destroy]
    before_action :set_zoo, only: [:show, :edit, :update, :destroy]

    def index
        @keepers = Keeper.all 
    end

    def show
    end

    def new
        @keeper = Keeper.new
    end

    def create
        @keeper = Keeper.new(keeper_params)
        @zoo = Zoo.find_by(id: @keeper.zoo_id)
        if @zoo.keeper_capacity == @zoo.keepers.count
            flash[:error] = "That Zoo cannot have anymore keepers! Please choose a different zoo."
            redirect_to new_user_keeper_path
        elsif @keeper.save
            redirect_to user_keepers_path(current_user, @keeper)
        else
            redirect_to root_path
        end
    end

    def edit
    end

    def update
        if @keeper.update(keeper_params)
            redirect_to keeper_path(@keeper)
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
        @zoo = Zoo.find(params[:id])
    end

    def keeper_params
        params.require(:keeper).permit(:name, :zoo_id)
    end
end
