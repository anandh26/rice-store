require 'yaml'

class CBInternalNetworkWhitelistConstraint

  def matches?(request)
    has_internal_ip?(request_ip(request)) || Rails.env.development?
  end

  private

  def has_internal_ip?(request_ip)
    internal_ip_list[:internal_ip_addresses].map{ |ip_address| ip_address.include?(request_ip) ? true : false }.any?
  end

  def internal_ip_list
    @@internal_ip_list ||= HashWithIndifferentAccess.new YAML.load_file(Rails.root.join('lib', 'route_constraints', 'cb_internal_network_whitelist_ip_list.yml'))
  end

  def request_ip(request)
    request.headers['CF-Connecting-IP'] || request.remote_ip
  end
end
