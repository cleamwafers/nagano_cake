class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  　has_many :products
  def index
  end

  def create
  end

  def edit
  end

  def update
  end

end
