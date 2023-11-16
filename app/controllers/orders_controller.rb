class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @orders_with_item_id = Order.where(item_id: @item.id)
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    if user_signed_in? && (current_user.id == @item.user.id || @orders_with_item_id.exists?)
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
