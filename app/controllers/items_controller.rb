class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item 
    else
      render :new
    end
  end


private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_cost_id, :shipping_location_id, :shipping_time_id)
  end
end
