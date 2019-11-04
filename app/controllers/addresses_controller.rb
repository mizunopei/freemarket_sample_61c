class AddressesController < ApplicationController

  def new
    if current_user.address
      @address = Address.find(current_user.id)
    else 
      @address = Address.new
    end

  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to card_signups_path
    end 
  end

  def update
    @address = Address.find(current_user.id)
    @address.update(address_params)
    redirect_to card_signups_path
  end

  private

  def address_params
    params.require(:address).permit(:d_last_name, :d_first_name, :d_last_name_kana, :d_first_name_kana, :postal_code, :area, :city, :address, :building_name, :building_tel).merge(user_id: current_user.id)
  end

end
