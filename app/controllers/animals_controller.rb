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

        if zoo_spaces_full?
            flash[:error] = "That Zoo cannot have anymore animals! Please choose a different zoo."
            redirect_to new_user_animal_path
        elsif @animal.save
            flash[:notice] = "Successfully added #{@animal.name}."
            redirect_to user_zoo_path(current_user, @animal.zoo)
        else
            flash[:error] = "Something went wrong. Please try again."
            redirect_to new_user_animal_path
        end
    end

    def edit
    end

    def update
        if zoo_spaces_full?
            flash[:error] = "That Zoo cannot have anymore animals! Please choose a different zoo."
            redirect_to edit_user_animal_path(current_user, @animal)
        elsif @animal.update(animal_params)
            flash[:notice] = "Successfully updated #{@animal.name}."
            redirect_to user_animal_path(current_user, @animal)
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
        @zoo = Zoo.find_by(id: params[:id])
    end

    def zoo_spaces_full?
        zoo = Zoo.find_by(id: @animal.zoo_id)
        zoo.animal_capacity == zoo.animals.count ? true : false
    end
    
    def animal_params
        params.require(:animal).permit(:name, :species, :personality, :zoo_id)
    end
end
