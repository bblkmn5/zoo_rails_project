class KeepersController < ApplicationController
    before_action :set_keeper, only: [:show, :edit, :update, :destroy]
    before_action :set_zoo, only: [:index, :show, :new, :create]

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
        if @keeper.save
            redirect_to keeper_path(@keeper)
        end
    end

    def edit
    end

    def update
        if @keeper.update(keeper_params)
            redirect_to keeper_path(@keeper)
        else
            redirect_to edit_keeper_path(@keeper)
        end
    end

    def destroy
        @keeper.delete
        flash[:alert] = "After much consideration, you have decided to lay off #{@keeper.name}. Goodbye #{@keeper.name}!"
        redirect_to zoo_keepers_path(:zoo_id)
    end

    private

    def set_keeper
        @keeper = Keeper.find(params[:id])
    end

    def set_zoo
        @zoo = Zoo.find_by(params[:id])
    end

    def keeper_params
        params.require(:keeper).permit(:name, :zoo_id)
    end
end
