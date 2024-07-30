class SpicesController < ApplicationController
  # GET /spices
  def index
    spices = Spice.all
    render json: spices
  end

  # POST /spices
  def create
    spice = Spice.new(spice_params)
    if spice.save
      render json: spice, status: :created
    else
      render json: spice.errors, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /spices/:id
  def update
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice
    else
      render json: { error: 'spice not found' }
    end
  end

  # DESTROY /spices/:id
  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      head :no_content
    else
      render json: { error: 'spice not found' }
    end
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
