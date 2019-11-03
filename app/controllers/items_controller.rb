class ItemsController < ApplicationController
  def index
  end

  def new
    render :new, layout: "signup"
  end
end

