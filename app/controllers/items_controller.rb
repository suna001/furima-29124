class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :area_id,:delivery_fee_id, :shipping_day_id, :user)
  end

end
