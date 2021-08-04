module Admin
  class UsersController < ApplicationController
    before_action :find_user, only: %i[show update edit destroy]
    before_action :authenticate_user!

    def index
      @users = User.order(created_at: :desc)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        flash[:notice] = "Your user is successfully created."
        UserMailer.welcome_email(@user,params[:user][:password]).deliver_later

        redirect_to admin_user_path(@user)
      else
        render 'new'
      end
    end

    def show; end

    def edit; end

    def update
      if @user.update user_params
        flash[:notice] = "Your User is successfully updated."
        
        redirect_to admin_user_path(@user)
      else
        render 'edit'
      end
    end

    def destroy
      @user.destroy
      flash[:notice] = "Your user is successfully deleted"

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, :address)
    end

    def find_user
      @user = User.find params[:id]
    end
  end
end
