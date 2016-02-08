require 'services/client_service'

class ClientProcedure < ApplicationProcedure
  ViewData = Struct.new(:result, :error_message, :user)

  def find_by_email
    response = client_service.find_by_email
  end

  def sign_in
    service_client = Services::ClientService.new(params)
    service_client.find_by_email_and_password
  end

  private
  def client_service
    Services::ClientService.new(params[:user])
  end
end
