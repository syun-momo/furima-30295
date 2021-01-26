class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    #@item = Item.new(item_params)
    #if @item.save
      #redirect_to root_path
    #else
      #render :new
    #end
  end

  #def item_params
    #params.require(:item).permit(:images, :name, :description, :category_id)
  #end

  private

  def redirect_root
    redirect_to root_path unless user_signed_in?
  end
end
