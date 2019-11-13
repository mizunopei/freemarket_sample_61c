class ItemsController < ApplicationController

  before_action :buy_info, only: [:pay_confirmation, :pay_complete] 

  def index
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

  def pay_confirmation
    card_info
    render :pay_confirmation, layout: "signup"
  end

  def pay
    @item = Item.find(params[:item_id])
    @card = current_user.card

    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
      redirect_to item_pay_complete_path
    else
      flash[:purchase] = '購入エラー'
      render :pay_confirmation
    end

  end

  def pay_complete
    card_info
    render :pay_complete, layout: "signup"
  end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :d_burden, :d_way, :d_date,:prefecture_id, :price,images: [])
  end

  def buy_info
    @item = Item.find(params[:item_id])
    @address = current_user.address
    @image = @item.images[-1]
  end

  def card_info
    @card = current_user.card
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.retrieve(@card.customer_id)
    @card = customer.cards.retrieve(@card.card_id)
    return @card
  end

end

