class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    redirect_to action: :index unless confirmation_user_id
  end

  def update
    if confirmation_user_id && @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if confirmation_user_id && @item.destroy(item_params)
 end

  private

  def item_params
    params.require(:item).permit(:product, :explain, :category_id, :state_id, :ship_fee_id, :prefecture_id, :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def confirmation_user_id
    @item.user.id == current_user.id
  end
end
