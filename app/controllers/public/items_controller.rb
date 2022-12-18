class Public::ItemsController < ApplicationController

  has_many :cart_items
  belongs_to :genres
  has_many :order_items

  def index
  end

  def show
  end
end
