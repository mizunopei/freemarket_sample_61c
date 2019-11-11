class CardsController < ApplicationController
  require "payjp"
  layout 'registration'
  
  def new
    card = Card.where(user_id: current_user.id)
    if card.exists?
      redirect_to root_path
    else
      @card = Card.new
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to complete_signups_path
      else
        redirect_to action: :create
      end
    end
  end

  def pay_confirmation
    render :pay_confirmation, layout: "signup"
  end

  def pay
  end

  def pay_complete
    render :pay_complete, layout: "signup"
  end

end
