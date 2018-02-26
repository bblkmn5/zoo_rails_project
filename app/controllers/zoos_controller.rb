class ZoosController < ApplicationController
    before_action :authenticate_user!
    before_action :set_zoo, only: [:show, :edit, :update]
    before_action :user_is_current_user, only: [:show, :edit, :update, :destroy]
    
    def other_zoo
        @zoos = Zoo.all_except(current_user.zoos)
    end

    # def index
    #     @zoos = Zoo.all 
    # end

    def show
    end

    def new
        @zoo = Zoo.new
        @zoo.keepers.build
        @zoo.animals.build
    end

    def create
        @user = User.last
        @zoo = Zoo.new(zoo_params)
        @zoo.user_id = @user.id
        if @zoo.save
            @user.update(zoo_id: @zoo.id)
            current_user.update(zoo_id: @zoo.id)
            
            redirect_to user_zoo_path(@zoo)
        elsif Zoo.where(name: @zoo.name).exists?
            flash[:notice] = "That Zoo already exists!"
            redirect_to user_path(@user)
        else
            flash[:alert] = "You need to fill out everything in the form!"
             redirect_to new_user_zoo_path(@user)
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

    private

    def set_zoo
        @zoo = Zoo.find(params[:id])
    end

    def zoo_params
        params.require(:zoo).permit(:name, :animal_capacity, :keeper_capacity, animals_attributes: [:name, :species, :personality, :zoo_id], keepers_attributes: [:name, :zoo_id])
    end
end
