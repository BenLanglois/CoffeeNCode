class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def create
        # @user = User.new(params[:user])
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            render 'new'
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
