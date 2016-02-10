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

  end
end