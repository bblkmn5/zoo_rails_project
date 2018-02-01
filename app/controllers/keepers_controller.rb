class KeepersController < ApplicationController
    before_action :set_keeper, only: [:show, :edit, :update, :destroy]

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
    end

    def destroy
    end

    private

    def set_keeper
        @keeper = Keeper.find(params[:id])
    end

    def keeper_params
        params.require(:keeper).permit(:name, :experience)
    end
end
