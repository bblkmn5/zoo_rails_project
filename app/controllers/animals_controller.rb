class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :edit, :update, :destroy]

    def index
        @animals = Animal.all
        @zoo = current_user.zoo
    end

    def show
    end

    def new
        @animal = Animal.new
    end

    def create
        @zoo = current_user.zoo
        @animal = Animal.new(animal_params)
        @animal.zoo_id = current_user.zoo_id
        if @animal.save
            redirect_to animal_path(@animal)
        end
    end

    def edit
    end

    def update
        if @animal.update(animal_params)
            redirect_to animal_path(@animal)
        else
            redirect_to edit_animal_path(@animal)
        end
    end

    def destroy
        @animal.delete
        flash[:alert] = "After much consideration, you have decided to set #{@animal.name} free. Goodbye #{@animal.name}!"
        redirect_to animal_path
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end
    
    def animal_params
        params.require(:animal).permit(:name, :species, :personality, :keepers_needed, :last_fed, :last_cleaned)
    end
end
