class SignupsController < ApplicationController

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
    @user = User.new
  end

  def create
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
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
      redirect_to new_address_path
    end
  end

  private

  def birthday_join
    # パラメータ取得
    date_year = params[:user]["birth_day(1i)"] 
    date_month = params[:user]["birth_day(2i)"]
    date_day = params[:user]["birth_day(3i)"]
    # ブランク時のエラー回避のため、ブランクだったら何もしない
    # if date["birth_day(1i)"].empty? && date["birth_day(2i)"].empty? && date["birth_day(3i)"].empty?
    #   return
    # end

    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    Date.new(date_year.to_i, date_month.to_i, date_day.to_i)

  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, :tel)
  end
  
end
