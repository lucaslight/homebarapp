class CabinetsController < ApplicationController
  def create
  end

  def update
  end

  def remove_from_stock
    @cabinet = Cabinet.find(params[:id])
    @cabinet.in_stock = !@cabinet.in_stock
    @cabinet.save!
    redirect_to cocktails_path
  end
end
