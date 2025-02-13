class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:edit, :update]
  before_action :authorize_user, only: [:edit, :update]


  def index
    @items= Item.order(created_at: :desc)
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

  def show
    if @item.nil?
      flash[:alert] = "Item not found"
      redirect_to items_path
    end
  end

  def exit
   
  end

  def update
      redirect_to @item, notice: '商品情報を更新しました。'
    else
      flash[:alert] = @item.errors.full_messages.join(", ")
      render :edit
    end
  end



private

  def item_params
  params.require(:item).permit( :image, :name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def authorize_user
    if @item.user_id != current_user.id
      redirect_to root_path, alert: 'あなたにはこの商品の編集権限がありません。'
    end
  end
end
