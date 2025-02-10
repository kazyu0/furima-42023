class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items= Item.all
    if @items.empty?
      @dummy_item = { name: 'ダミー商品', description: 'ここに商品がありません。' }
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path,notice: 'Item was successfully created.'
    else
      render :new
    end
  end


private

  def item_params
  params.require(:item).permit( :image, :name, :item_description, :category_id, :item_condition_id, :shipping_fee_burden_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
