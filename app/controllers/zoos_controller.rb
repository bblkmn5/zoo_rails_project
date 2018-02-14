class ZoosController < ApplicationController
    before_action :set_zoo, only: [:show, :edit, :update, :destroy, :keepers_index, :animals_index]

    def other_zoo
        @zoos = Zoo.all_except(current_user.zoo)
    end

    def index
        @zoos = Zoo.all 
    end

    def show
        @user = current_user
    end

    def new
        @zoo = Zoo.new
    end

    def create
        @zoo = Zoo.new(zoo_params)
        @zoo.id == current_user.zoo_id 
        if @zoo.save
            redirect_to zoo_path(@zoo)
        else
            redirect_to current_user
        end
    end

    def edit
    end

    def update
        if @zoo.update(zoo_params)
            redirect_to zoo_path(@zoo)
        else
            redirect_to edit_zoo_path(@zoo)
        end
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
        params.require(:zoo).permit(:name, :animal_capacity, :keeper_capacity)
    end
end
