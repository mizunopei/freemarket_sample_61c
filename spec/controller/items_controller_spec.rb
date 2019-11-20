require 'rails_helper'

describe ItemsController do
  
  def show
    @item = Item.find(params[:id])
    @images = @item.images.order(id: "DESC")
  end

end