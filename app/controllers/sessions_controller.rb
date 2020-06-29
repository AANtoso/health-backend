class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:session][:username])

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
        else
            render json: {
                error: "Invalid Login"
            }
    end

    def get_current_user
        if logged_in?
            render json :UserSerializer.new(current_user)
        else render json: {
            error: "There is no user logged in at this time."
        }
        end
    end

    def destroy
        session.clear
        render json: {
            notice: "User is logged out."
        }, status: 200
    end

end
