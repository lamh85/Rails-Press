class UsersController < ApplicationController

    # Table of contents: C, R, U, D

    def new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            render text: 'success!'
        else
            render text: user.errors
        end
    end

    private

    def user_params
        params.require(:user).permit(*User.attrs_array, :password, :password_confirmation)
    end

end