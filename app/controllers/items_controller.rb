class ItemsController < ApplicationController
  def index
  end

  def show 
    # @pictures = Picture.where(item_id: @item.id).limit(4)
    # @user_item = Item.narabikae.where(user_id: @item.user_id).where.not(id: @item.id).limit(3) 
  end
  
  def new
    @item = Item.new
    render :new, layout: "signup"
  end

  def create
    Item.create(item_params)
    redirecty_to action: "index"
  end

  private
  def item_params
    params.repuire(:item).permit(:name, :introduction, :condition, :d_burden, :d_way, :d_date, :prefecture_id, :price, images: [])
  end
end

