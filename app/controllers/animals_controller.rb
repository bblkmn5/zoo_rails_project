class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :edit, :update, :destroy]
    before_action :set_zoo, only: [:index, :show, :create]
    
    def index
        @animals = Animal.all
    end

    def show
    end

    def new
        @animal = Animal.new
    end

    def create
        @animal = Animal.new(animal_params)
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
        redirect_to zoo_animals_path(:zoo_id)
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end

    def set_zoo
        @zoo = current_user.zoo
    end
    
    def animal_params
        params.require(:animal).permit(:name, :species, :personality, :keepers_needed, :last_fed, :last_cleaned, :zoo_id)
    end
end
