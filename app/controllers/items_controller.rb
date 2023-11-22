class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :orders_with_item_id, only: [:show, :edit]

  def index
    @items = Item.all.order("created_at DESC")
    @orders = Order.all
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user.id && @orders_with_item_id.blank?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
    @item.destroy
    redirect_to action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def orders_with_item_id
    @orders_with_item_id = Order.where(item_id: @item.id)
  end

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :prefecture_id, :shipping_charge_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end
