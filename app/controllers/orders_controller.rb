class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id)
  end

end
