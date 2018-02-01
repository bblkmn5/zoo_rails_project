class KeepersController < ApplicationController
    before_action :set_keeper, only: [:show, :edit, :update, :destroy]

    def index
        @keepers = Keeper.all 
    end

    def show
    end

    def new
    end

    def create
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
