class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :edit, :update, :destroy]

    def index
        @animals = Animal.all
        @zoo = Zoo.first.name
    end

    def show
    end

    def new
        @animal = Animal.new
    end

    def create
        @animal = Animal.new(animal_params)
        if @save
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
        redirect_to animal_path
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end
    
    def animal_params
        params.require(:animal).permit(:name, :species, :gender, :personality, :hungry, :clean)
    end
end
