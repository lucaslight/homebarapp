class CabinetsController < ApplicationController
  def create
  end

  def update
  end

  def remove_from_stock
    @cabinet = Cabinet.find(params[:id])
    @cabinet.toggle!(:in_stock)
    redirect_back(fallback_location: root_path)
  end

  def add_to_stock
    @item_cabinet = Cabinet.find_or_create_by(user_id: current_user.id, ingredient_id: params[:id])
    @item_cabinet.update(in_stock: true)
    redirect_back(fallback_location: root_path)
  end
end
