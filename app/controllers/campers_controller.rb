class CampersController < ApplicationController

  def index
    campers = Camper.all
    render json: campers, include: ['campers']
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, include: ['campers', 'activities']
  end

  def create
    camper = Camper.create(camper_params)
    if camper.valid?
      render json: camper, status: :created
    else
      render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

end