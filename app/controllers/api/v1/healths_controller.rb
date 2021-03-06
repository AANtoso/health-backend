class Api::V1::HealthsController < ApplicationController

    def index
        @healths = Health.all 
        render json: @healths, include: :medications, status: 200
    end

    def create
        @health = Health.new(health_params)
        if @health.save
            render json: @health.to_json(include: [:medications]), status: 200
        end
    end
    def show
        @health = Health.find_by(id:params[:id])
        options = {
            include: [:medications]
        }
        render json: @health.to_json(include: [:medications]), status: 200
    end

    def update
        if health = Health.find(params[:id])
        health.update(health_params)
        render json: HealthSerializer.new(health), status: 200

        else
            render json: {error: 'ERROR CREATING HEALTH'}
        end
    end

    def destroy
        @health = Health.find_by(id:params[:id])
        @health.destroy
            render json: @health.to_json(include: [:medications]), status: 200
    end

    private

    def health_params
        params.require(:health).permit(:diagnosis)
    end
end
