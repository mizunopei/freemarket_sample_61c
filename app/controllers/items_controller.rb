class ItemsController < ApplicationController
  def index
    @items = Item.limit(10).order('created_at DESC')
  end

  def show
  end
  
  def new
    @item = Item.new
    render :new, layout: "signup"
  end

  def create
    @item= Item.new(item_params)
    if @item.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :d_burden, :d_way, :d_date,:prefecture_id, :price,images: [])
  end

end

