class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    render :new, layout: "signup"
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id]) 
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if item.user_id == current_user.id
    flash[:notice] = "商品を削除しました"
    redirect_to action: "index"
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :d_burden, :d_way, :d_date,:prefecture_id, :price,images: []).merge(user_id: current_user.id)
  end

end

