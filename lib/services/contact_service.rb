require 'route_constraints/cb_internal_network_whitelist_constraint'
require 'services/responses/registration_response'

module Services
  class ContactService
    attr_reader :name, :email, :subject, :message, :is_internal

    def initialize(user_info, request)
      @name = user_info[:name]
      @email = user_info[:email]
      @subject = user_info[:subject]
      @message = user_info[:message]
      @is_internal = request_is_internal?(request)
    end

    def create
      begin
        user = new_contact_request
        user.save
        Services::Responses::RegistrationResponse.new(true, nil, user)
      rescue => ex
        Services::Responses::RegistrationResponse.new(false, 'an error occurred', nil)
      end
    end

    private

    def new_contact_request
      client = Contact.new
      client.name = name
      client.email = email
      client.subject = subject
      client.is_internal = is_internal
      client.message = message
      client.status = true
      client
    end

    def request_is_internal?(request)
      CBInternalNetworkWhitelistConstraint.new.matches?(request)
    end
  end
end
