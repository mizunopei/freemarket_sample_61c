class ItemsController < ApplicationController
  def index
  end

  def show
  end
  
  def new
    render :new, layout: "signup"
  end
end

