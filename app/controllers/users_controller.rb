class UsersController < ApplicationController
    def explore
        @users = User.all.order("created_at DESC")
    end
end
