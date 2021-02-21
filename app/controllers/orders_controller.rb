class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_index
  before_action :set_item, only: [:index, :create]

  def index
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
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
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def move_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
