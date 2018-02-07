class ZoosController < ApplicationController
    before_action :set_zoo, only: [:show, :keepers_index, :animals_index]

    def index
        @zoos = Zoo.all_except(current_user)
    end

    def show
        @user = current_user
    end

    def keepers_index
        @keepers = @zoo.keepers
        render "keepers/index"
    end

    def animals_index
        @animals = @zoo.animals
        render "animals/index"
    end

    private

    def set_zoo
        @zoo = Zoo.find(params[:id])
    end

    def zoo_params
        params.require(:zoo).permit(:name, :animal_capacity, :keeper_capacity, :user_attributes => [:username])
    end
end
