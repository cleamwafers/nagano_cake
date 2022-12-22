class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  has_many :order_items,dependent: :destroy
  belongs_to :customers
  has_one_attached :profile_image

  def show
    @orders = Order.page(params[:page])
  end

  def update
  end
end
