class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :derivery_id, :price).merge(user_id: current_user.id)
  end
end
