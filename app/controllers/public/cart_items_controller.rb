class Public::CartItemsController < ApplicationController
   before_action :authenticate_customer!
   before_action :set_cart_item, only: [:update, :destroy]

  def index
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    flash.now[:success] = "#{@cart_item.product.name}の数量を変更しました"
    @price = sub_price(@cart_item).to_s(:delimited)
    @cart_items = current_cart
    @total = total_price(@cart_items).to_s(:delimited)
    # redirect_to public_cart_items_path
  end

  def destroy
    cart_item = Cart_items.find(params_cart_item)
    cart_item.destroy
    redirect_to  public_cart_items_path


    #   # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
    # @update_cart_item =  CartItem.find_by(item_id: )
    # if @update_cart_item.present? && @cart_item.valid?
    #     @cart_item.amount += @update_cart_item.amount
    #     @update_cart_item.destroy
    # end

    # if @cart_item.save
    #   flash[:notice] = "#{@cart_item.item.name}をカートに追加しました"
    #   redirect_to items_path
    # else
    #   @item = Item.find(params[:cart_item][:product_id])
    #   @cart_item = CartItem.new
    #   flash[:alert] = "個数を選択してください"
    #   render ("customer/items/show")
    # end
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to public_cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)

      # カートの中に同じ商品が重複しないようにして　古い商品と新しい商品の数量を合わせる
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
