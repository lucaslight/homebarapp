class CabinetsController < ApplicationController
  def create
  end

  def update
  end

  def add_to_stock
    @cabinet = Cabinet.find(params[:id])
    @cabinet.in_stock = true
    @cabinet.save!
    redirect_back(fallback_location: root_path)
  end

  def remove_from_stock
    @cabinet = Cabinet.find(params[:id])
    @cabinet.in_stock = !@cabinet.in_stock
    @cabinet.save!
    redirect_back(fallback_location: root_path)
  end
end
