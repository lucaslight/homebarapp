class CabinetsController < ApplicationController
  def create
  end

  def update
  end

  def add_to_stock
    @grocery_list.each do |item|
      #  item
      #  item.name
      #  item.id
      @item_cabinet = Cabinet.find_by(user_id: current_user.id, ingredient_id: item.id)
      # @item_cabinet
      if @item_cabinet && @item_cabinet.in_stock == false
        @item_cabinet.in_stock = true
        @item_cabinet.save!
      elsif @item_cabinet == nil
        Cabinet.create!(user_id: current_user.id, ingredient_id: item.id)
      end
      # @cabinet = Cabinet.find(params[:id])
      # @cabinet.in_stock = true
      # @cabinet.save!
      redirect_back(fallback_location: root_path)
    end
  end

  def remove_from_stock
    @cabinet = Cabinet.find(params[:id])
    @cabinet.in_stock = !@cabinet.in_stock
    @cabinet.save!
    redirect_back(fallback_location: root_path)
  end
end
