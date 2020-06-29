class Api::V1::UsersController < ApplicationController
    before_action :set_user

    def index
        users = User.all
        render json: users, status: 200
    end

    def create
        user = User.new(user_params)

        if user.save 
            session[:user_id] = user.id 
            render json: UserSerializer.new(user), status: 200
        else
            resp = {
                error: users.error.full_messaged.to_sentence
            }
            render json: user.errors, status: 400
        end
    end

    def show
        user_json = UserSerializer.new(user).serialized_json
        render json: user_json
    end

    private

    def set_user
    end

    def user_params
    end
end
