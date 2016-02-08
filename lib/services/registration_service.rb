require 'services/responses/registration_response'
require 'route_constraints/cb_internal_network_whitelist_constraint'

module Services
  class RegistrationService
    attr_reader :user_name, :first_name, :last_name, :email, :password, :send_email, :ip_address, :user_agent, :is_internal

    def initialize(user_info, request)
      @user_name = user_info[:user_name]
      @first_name = user_info[:first_name]
      @last_name = user_info[:last_name]
      @email = user_info[:email]
      @password = user_info[:password]
      #@send_email = user_info[:send_email]
      @ip_address = request.ip
      @user_agent = request.user_agent
      @is_internal = request_is_internal?(request)
    end

    def register_user
      begin
        user = new_user_request
        user.save
        Services::Responses::RegistrationResponse.new(true, nil, user)
      rescue => ex
        Services::Responses::RegistrationResponse.new(false, 'an error occurred', nil)
      end
    end

    private

    def new_user_request
      client = User.new
      client.user_name = user_name
      client.first_name = first_name
      client.last_name = last_name
      client.email = email
      client.password = password
      #client.ip_address = ip_address
      client.is_internal = is_internal
      client.user_agent = user_agent
      client.status = true
      client
    end

    def request_is_internal?(request)
      CBInternalNetworkWhitelistConstraint.new.matches?(request)
    end
  end
end
