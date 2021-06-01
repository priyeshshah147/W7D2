class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user.id)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def user_params
        params.require(:user).permit(:email, :session_token)
    end 

    def new
        render :new
    end

end