class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def new
    @order = Order.new
  end
  
  def create
    @user_order = UserOrder.new(order_params)
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_c2629eed723ce5387c889ba7"

      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
