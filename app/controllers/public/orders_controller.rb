class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def comfirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @total_price = 0
    @order.shopping_fee = 800
   if params[:order][:adresses_method] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.full_name
   elsif params[:order][:adresses_method]== "1"

    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
   else params[:order][:adresses_method] == "2"

   end
  end

  def thanx
  end

  def create
    @order = Order.new(order_params)
     @order.customer_id =current_customer.id
     @order.save
    current_customer.cart_items.each do |cart_item|
      order_item =OrderItem.new
      order_item.item_id =cart_item.item_id
      #リレーションを生かして値段を持ってくる
      order_item.purchase_price =cart_item.item.price
      order_item.order_id =@order.id
      order_item.quantity =cart_item.amount
      order_item.production_status = 0
      order_item.save
    end
    current_customer.cart_items.destroy_all
     redirect_to thanx_public_orders_path
  end

  def index
   @orders = Order.all
  end

  def show
   @order = Order.find(params[:id])
  end

private
  def order_params
    params.require(:order).permit(:pay_type, :address, :postal_code, :name,:total_payment,:shopping_fee,:status)
  end
end