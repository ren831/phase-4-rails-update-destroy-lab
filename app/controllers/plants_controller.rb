class PlantsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plant
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def udpate
    plant = find_plant
    render json: plant 
  end

  def destroy
    plant = find_plant
    plant.destroy
    head :no_content
  end

  private

  def plant_params
    params.permit(:id, :name, :image, :price, :is_in_stock)
  end

def find_plant
  plant = Plant.find(params[:id])
end

end
