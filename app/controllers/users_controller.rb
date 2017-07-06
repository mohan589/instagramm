class UsersController < ApplicationController
    before_action :set_user, only: [:update]

    def explore
        @users = User.all.order("created_at DESC")
    end

    def update

        if @user.update(user_params)
            redirect_to root_path
        else
          redirect_to root_path, notice: 'Opps something went wrong!'
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:avatar, :id)
    end
end
