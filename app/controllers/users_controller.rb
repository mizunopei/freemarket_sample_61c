class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def logout
  end

  def profile
  end

  def personal
  end

  def card
  end
  
  def exhibit
    @item = Item.where(user_id: current_user.id)
  end

end
