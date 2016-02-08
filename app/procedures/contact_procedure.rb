require 'services/contact_service'

class ContactProcedure < ApplicationProcedure
  def view_data
    contact_service.create
  end

  private

  def contact_service
    Services::ContactService.new(params[:contact], request)
  end
end
