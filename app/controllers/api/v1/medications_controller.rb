class Api::V1::MedicationsController < ApplicationController
    before_action :set_medication, only: [:index, :show]
    def index
        @medications = @health.medications 
        render json: @medications.to_json(include: [:health]), status: 200
    end

    def create
        @health = Health.find(params[:health_id])
        @medication = @health.medications.build(medication_params)
        if @medication.save
            render json: @health.to_json(include: [:medications]), status: 200
        else
            render json: {error: "MEDICATION NOT SAVED"}
        end
    end

    def show
        @medication = Medication.find_by(id:params[:id])
        render json: @medication.to_json(include: [:health]), status: 200
    end

    def update
        @medication = Medication.find_by(id:params[:id])
        @health = Health.find(@medication.health_id)
        @medication.update(medication_params)
        render json: @health.to_json(include: [:medications]), status: 200
    end

    def destroy
        @medication = Medication.find_by(id:params[:id])
        @health = Health.find(@medication.health_id)
        @medication.destroy
            render json: @health.to_json(include: [:medications]), status: 200
    end

    private

    def set_medication
        @medication = Medication.find(params[:id])
    end

    def medication_params
        params.require(:medication).permit(:health_id, :name, :dose, :frequency)
    end
end
