class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @orders = current_customer.orders
  end

  def comfirm

  end

  def thanx
  end

  def create
  end

  def index
  end

  def show
  end
end

private
