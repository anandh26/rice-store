class ContactController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    ContactProcedure.new(self, request).view_data
    respond_to do |format|
      format.json { render json: { sent: 'true', status: 200 } }
    end
  end
end
