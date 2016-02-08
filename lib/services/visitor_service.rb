require 'route_constraints/cb_internal_network_whitelist_constraint'
require 'services/responses/registration_response'

module Services
  class VisitorService
    attr_reader :browser_id, :is_internal, :ip_address

    def initialize(bid, request = nil)
      @browser_id = bid
      @ip_address = request.ip
      @user_agent = request.user_agent
      @is_internal = request_is_internal?(request)
    end

    def visitor_id
      begin
        visitor = new_visitor_request
        visitor.save
        Services::Responses::RegistrationResponse.new(true, nil, visitor)
      rescue => ex
        Services::Responses::RegistrationResponse.new(false, 'an error occurred', nil)
      end
    end

    private

    def new_visitor_request
      visitor = Visitor.new
      visitor.unique_id = SecureRandom.urlsafe_base64(nil,false)
      visitor.browser_id = browser_id
      visitor.ip_address = ip_address
      visitor.is_internal = is_internal
      visitor
    end

    def request_is_internal?(request)
      CBInternalNetworkWhitelistConstraint.new.matches?(request)
    end
  end
end
