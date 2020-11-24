class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :move_to_index, except: [:index, :new, :show]
  
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
    elsif 
      @item.image = fixture_file_upload('public/images/test_image.png')
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :image, :description, :category_id, :condition_id, :area_id,:delivery_fee_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
