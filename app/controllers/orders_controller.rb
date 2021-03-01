class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    binding.pry
    if @order.valid?
      # pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).merge(user_id: current_user.id, item_id: params[:item_id])
    # token: params[:token]
  end

  def pay_item
  end
  
end
