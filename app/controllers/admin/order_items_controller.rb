class Admin::OrderItemsController < ApplicationController
before_action :authenticate_admin!

 belongs_to :order
 belongs_to :items
  def update
  end
end
