class PurchasersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchaser_destination = PurchaserDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchaser_destination = PurchaserDestination.new(purchaser_destination_params)
    if @purchaser_destination.valid?
      @purchaser_destination.save
      redirect_to purchase_confirmation_path(@item), notice: "Purchase was successful create"
    else
      render :index, status: :unprocessable_entity
    end
  end

  


  private

  def purchaser_destination_params
    params.require(:purchaser_destination).permit(:purchaser_id, :item_id, :post_code, :prefecture_id, :city_code, :street_addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

