class PurchasersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_item
  before_action :check_item_status


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]  
    @purchaser_destination = PurchaserDestination.new
  end

  def create
    @purchaser_destination = PurchaserDestination.new(purchaser_destination_params)

    if @purchaser_destination.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: purchaser_destination_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )


      @purchaser_destination.save
      redirect_to root_path 
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  
  

  private

  def purchaser_destination_params
    params.require(:purchaser_destination).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number ).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find_by(id: params[:item_id])
    end
 

  def check_item_status
    if @item.user_id == current_user.id
      redirect_to root_path, alert: "自身が出品した商品の購入はできません。"
    elsif  @item.purchaser.present? 
    redirect_to root_path, alert: "この商品はすでに売り切れています。"
    end
  end
end

