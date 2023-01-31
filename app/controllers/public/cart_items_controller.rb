class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!


  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount].to_i)
    flash.now[:success] = "#{@cart_item.item.name}の数量を変更しました"
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to  public_cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to public_cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

      # カートの中に同じ商品が重複しないようにして 古い商品と新しい商品の数量を合わせる
    if @update_cart_item = current_customer.cart_items.find_by(item: @cart_item.item)
     @update_cart_item.update(amount: @update_cart_item.amount + @cart_item.amount)
     redirect_to public_cart_items_path
    #重複していない時データを追加する
    else
     @cart_item.save
     redirect_to public_cart_items_path
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end
end
