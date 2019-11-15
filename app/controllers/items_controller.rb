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
      flash[:notice] = "商品を出品しました"
      redirect_to :root
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
    redirect_to :root
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # binding.pry
    item = Item.find(params[:id])
    images = item.images.attachments
    images.purge



    if item.user.id == current_user.id
      item.update(item_params)
    end
    flash[:notice] = "商品の更新をしました"
    redirect_to :root

  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :d_burden, :d_way, :d_date,:prefecture_id, :price,:category_id,images: []).merge(user_id: current_user.id)
  end

end

