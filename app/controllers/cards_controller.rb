class CardsController < ApplicationController
  require "payjp"
  # before_action :set_card

  def new
    @card = Card.new
  end

  def create
    Payjp.api_key = 'sk_test_56b3cab016b2be4b567a64f2'

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        description: 'test',
        # email: current_user.email,
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

  # private

  # def set_card
  #   @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  # end

end
