class SignupsController < ApplicationController

  layout 'registration'

  def login
    render :login, layout: "signup"
  end

  def signup
    render :signup, layout: "signup"
  end
  
  def registration
  end
  
  def sms_confirmation
  end

  def address
  end

  def card
  end

  def complete
  end
  
end
