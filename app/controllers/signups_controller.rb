class SignupsController < ApplicationController
  before_action :redirect_root, except: :complete

  layout 'registration'

  def login
    render :login, layout: "signup"
  end

  def index
    render :index, layout: "signup"
  end
  
  def new
    @user = User.new
  end
  
  def sms_confirmation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_day] = birthday_join
    session[:provider] = session[:provider]
    session[:uid] = session[:uid]
    @user = User.new
  end

  def create
    if session[:provider].present? && session[:uid].present?
      password = set_password
      @user= User.new(
        nickname: session[:nickname], 
        email: session[:email], 
        password: password, 
        password_confirmation: password, 
        last_name: session[:last_name], 
        first_name: session[:first_name], 
        last_name_kana: session[:last_name_kana], 
        first_name_kana: session[:first_name_kana], 
        birth_day: session[:birth_day], 
        tel: user_params[:tel]
        )
    else
      @user= User.new(
        nickname: session[:nickname], 
        email: session[:email], 
        password: session[:password], 
        password_confirmation: session[:password_confirmation], 
        last_name: session[:last_name], 
        first_name: session[:first_name], 
        last_name_kana: session[:last_name_kana], 
        first_name_kana: session[:first_name_kana], 
        birth_day: session[:birth_day], 
        tel: user_params[:tel]
        )
    end
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
      redirect_to new_address_path
    else
      render :new
    end
  end

  def complete
  end

  private

  def redirect_root
    redirect_to root_path if user_signed_in?
  end

  def birthday_join
    date_year = params[:user]["birth_day(1i)"] 
    date_month = params[:user]["birth_day(2i)"]
    date_day = params[:user]["birth_day(3i)"]
    
    if date_year.empty? && date_month.empty? && date_day.empty?
      return
    end

    date = Date.new(date_year.to_i, date_month.to_i, date_day.to_i)
  end

  def set_password
    password = Devise.friendly_token.first(7)
    if password.match(/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i)
      return password
    else
      set_password
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :tel)
  end
  
end
