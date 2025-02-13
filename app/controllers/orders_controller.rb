class OrdersController < ApplicationController

  def new
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:purchaser_id, :item_id, :post_code, :prefecture_id, :city_code, :street_addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
end
