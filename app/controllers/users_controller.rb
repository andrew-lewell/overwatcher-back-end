class UsersController < ApplicationController

    def signin
        user = User.find_by(email: user_params[:email])

        if user && user.authenticate(user_params[:password])
            render json: user
        else 
            render json: { error: "Username or password not found." }, status: 401
        end
    end 

    def signup
        user = User.new(user_params)

        if user.save
            render json: user 
        else 
            render json: { error: user.errors.full_messages }, status: 403
        end
    end 

    def validate
        if logged_in?
            render json: @current_user
        else
            render json: { errors: "Unauthorized" }, status: 401
        end
    end 

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
