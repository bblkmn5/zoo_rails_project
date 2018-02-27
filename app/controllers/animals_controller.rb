class AnimalsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_animal, only: [:show, :edit, :update, :destroy]
    before_action :user_is_current_user, only: [:show, :edit, :update, :destroy]
    before_action :set_zoo, only: [:show, :edit, :update]
    
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
        @zoo = Zoo.find_by(id: @animal.zoo_id)

        if @zoo.animal_capacity == @zoo.animals.count
            flash[:error] = "That Zoo cannot have anymore animals! Please choose a different zoo."
            redirect_to new_user_animal_path
        elsif @animal.save
            redirect_to user_zoo_path(current_user, @zoo)
        else
            flash[:error] = "Something went wrong. Please try again."
            redirect_to new_user_animal_path
        end
    end

    def edit
    end

    def update
        if @animal.update(animal_params)
            redirect_to animal_path(@animal)
        else
            redirect_to edit_user_animal_path(current_user, @animal)
        end
    end

    def destroy
        @animal.delete
        flash[:alert] = "After much consideration, you have decided to set #{@animal.name} free. Goodbye #{@animal.name}!"
        redirect_to user_animals_path(:zoo_id)
    end

    private

    def set_animal
        @animal = Animal.find(params[:id])
    end

    def set_zoo
        @zoo = Zoo.find(params[:id])
    end
    
    def animal_params
        params.require(:animal).permit(:name, :species, :personality, :zoo_id)
    end
end
