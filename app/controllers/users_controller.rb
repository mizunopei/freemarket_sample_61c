class UsersController < ApplicationController
  def index
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
   
  end
  
  def item_params
    params.require(:item).permit(:name, :introduction, :condition, :d_burden, :d_way, :d_date,:prefecture_id, :price,images: []).merge(user_id: current_user.id)
  end

end
