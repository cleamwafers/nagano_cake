class Public::CartItemsController < ApplicationController
   before_action :authenticate_public!

   belongs_to :items
   belongs_to :customers

  def index
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  def create
  end
end
