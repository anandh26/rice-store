require 'services/registration_service'

class RegistrationProcedure < ApplicationProcedure
  ViewData = Struct.new(:result, :error_message, :user)

  def view_data
    response = registration_service.register_user
    session[:user] = response.user
    response
  end

  private

  def registration_service
    Services::RegistrationService.new(params[:user], request)
  end
end
