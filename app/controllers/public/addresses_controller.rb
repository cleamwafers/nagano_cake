class Public::AddressesController < ApplicationController
before_action :authenticate_public!
  belongs_to :customers

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
