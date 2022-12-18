class Public::CustomersController < ApplicationController

  has_many :adresses
  has_many :order_items
  has_many :cart_items

  def show
  end

  def edit
  end

  def update
  end

  def quit
  end

  def out
  end
end
