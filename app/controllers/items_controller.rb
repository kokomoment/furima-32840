class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :confirmation_user_id, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
 end

  private

  def item_params
    params.require(:item).permit(:product, :explain, :category_id, :state_id, :ship_fee_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def confirmation_user_id
    redirect_to action: :index unless @item.user.id == current_user.id
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end
end
