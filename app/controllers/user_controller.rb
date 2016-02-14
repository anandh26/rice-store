class UserController < ApplicationController
  def sign_in
    response = ClientProcedure.new(self).sign_in
    if response.present?
      session[:user] = response
      redirect_to root_path
    else
      flash[:error] = 'Sorry, We could not find you, please use forget password'
      render :login
    end
  end

  def sign_out
    session[:user] = nil
    redirect_to sign_in_path
  end

  def login
  end

  def register
    @user = User.new
  end

  def create
    response = ClientProcedure.new(self, request).find_by_email
    if response.nil?
      @view_data = RegistrationProcedure.new(self, request).view_data
      if @view_data.status
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :register
      end
    else
      flash[:error] = 'We already have you in our database, please use your email to login'
      render :register
    end
  end

  def profile
    @user = User.find_by(email: session[:user]['email'])
  end

  def update_profile
    @user = User.find_by(email: session[:user]['email'])
    if @user.present?
      @user.first_name  = params[:first_name]
      @user.last_name  = params[:last_name]
      @user.password  = params[:password]
      @user.phone  = params[:phone]
      @user.address_1  = params[:address_1]
      @user.address_2  = params[:address_2]
      @user.city  = params[:city]
      @user.country  = params[:country]
      @user.postal_code  = params[:postal_code]
      @user.save
    end
    respond_to do |format|
      format.js {render layout: false}
    end
  end

  def orders
    @orders = ShoppingCart.all.where(email: session[:user]['email'])
  end

  def my_points
    @points = RedeemPoint.all.where(email: session[:user]['email'])
  end

  def my_coupons

  end
end