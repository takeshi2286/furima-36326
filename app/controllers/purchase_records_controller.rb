class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      binding.pry
      Payjp.api_key = "sk_test_04916d6abbb950ab15ae84d5" 
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def purchase_params
    params.require(:order).permit(:post_number, :prefecture_id,:purchaser_city, :purchaser_address,  
                                            :purchaser_building, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def order_params
    params.require(:order).permit(:number, :exp_month, :exe_year).merge(token: params[:token])
  end


end
