class AddressesController < ApplicationController
  layout 'registration'
  
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to new_card_path
    else
      render :new
    end 
  end

  def update
    @address = Address.find(current_user.address.id)
    if @address.update(address_params)
      redirect_to new_card_path
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:d_last_name, :d_first_name, :d_last_name_kana, :d_first_name_kana, :postal_code, :area, :city, :address, :building_name, :building_tel).merge(user_id: current_user.id)
  end

end
