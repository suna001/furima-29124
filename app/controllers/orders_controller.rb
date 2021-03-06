class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :order_set, only: [:index, :create]
  def index
   @user_order = UserOrder.new
   if current_user.id == @item.user_id
       redirect_to root_path
    elsif
       @item.order.present? 
       redirect_to root_path
    else
   end
  end

  def new
    @order = Order.new
  end
  
  
  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?

      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

  def order_set
    @item = Item.find(params[:item_id])
  end
end
