class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
        render :new
    end

    def create
        
    end

    def edit

    end

    def update

    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    private

    def user_params
        params.require(:user).
    end 
end
