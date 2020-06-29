class Api::V1::HealthsController < ApplicationController
    before_action :set_health

    def index
        if logged_in?
        
        healths = current_user.healths

        render json: HealtSerializer.new(healths)

        else
            render json: {
                error: "Please login to view this page!"
            }
        end
    end

    def create
        health = current_user.healths.build(health_params)

        if health.save
            render json: HealtSerializer.new(health), status: 200
        
        else
            resp = {
                error: health.errors.full_messages.to_sentence
            }
            render json: resp, status: 400
        end
    end

    def show
        render json: health
    end

    def update
        if health = Health.find(params[:id])
        health.update(health_params)
        render json: HealtSerializer.new(health), status: 200

        else
            resp = {
                error: health.error.full_messages.to_sentence
            }
            render json: health.errors, status: 400
        end
    end

    def destroy
        if @health.destroy
            render json: { data: "Health condition deleted." }, status: 200
        
        else
            resp = {
                error: "Health condition not found."
            }
            render json: @health.errors, status: :unprocessable_entity
        end
    end

    private

    def set_health
    
    end

    def health_params
    
    end
end
