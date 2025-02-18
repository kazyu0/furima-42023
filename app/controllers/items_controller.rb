class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  

  


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
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報を更新しました。'
    else
      flash[:alert] = @item.errors.full_messages.join(", ")
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
    redirect_to root_path, notice: '商品を削除しました。'
  else
    redirect_to @item, alert: '商品を削除できませんでした。'
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
    elsif @item.purchaser.present?
      redirect_to root_path, alert: '売り切れた商品の編集はできません。'
    end
  end

 
end
