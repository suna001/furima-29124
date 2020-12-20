class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :new, :show]
  before_action :item_set, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
    @orders = Order.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # unless user_signed_in?
    #   redirect_to new_user_session_path
    # end
  end

  def edit
    unless current_user.id == @item.user_id
      redirect_to action: :show
    end
  end
  
  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to action: :index
    else
      redirect_to action: :show
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

  def item_set
    @item = Item.find(params[:id])
  end

end
