class Public::OrdersController < ApplicationController
  before_action :authenticate_public!

  has_many :order_items,dependent: :destroy
  belongs_to :customers

  has_one_attached :profile_image

  def new
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
