class KeepersController < ApplicationController
    def index
    end

    def show
        @keeper = Keeper.find_by(params[:id])
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

    def keeper_params
        params.require(:keeper).permit(:name, :experience)
    end
end
