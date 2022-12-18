class Public::OrderItemsController < ApplicationController
  belongs_to :order
  has_many :items

end
