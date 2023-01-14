class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  # has_one_attached :profile_image

  def show
    @orders = Order.page(params[:page])
  end

  def update
    @order = Order.find(params[:id])
		if @order.update(order_params)
		   flash[:success] = "注文ステータスを変更しました"
		   redirect_to admin_order_path(@order)
		else
		   render "show"
		end
  end
end
