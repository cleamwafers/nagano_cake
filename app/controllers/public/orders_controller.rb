class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def comfirm
    @cart_items =CartItem.all
    @order = Order.new(order_params)
    @total_price = 0
    @order.shopping_fee = 800
   if params[:order][:adresses_method] == "0"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
   elsif params[:order][:adresses_method]== "1"
    @order = Order.new(order_params)
    @order.shopping_fee = 800
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
   else params[:order][:adresses_method] == "2"
    @order = Order.new(order_params)
    @order.shopping_fee = 800
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
   end
  end

  def thanx
  end

  def create
    
  end

  def index
 @orders = Order.all
  end

  def show
  end

private
  def order_params
    params.require(:order).permit(:pay_type, :address, :postal_code, :name)
  end
end