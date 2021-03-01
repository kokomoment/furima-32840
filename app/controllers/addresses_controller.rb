class AddressesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:address).prrmit(:postcode, :prefecture_id, :city, :block, :building, :phone_number)
  end
end
