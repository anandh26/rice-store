require 'route_constraints/cb_internal_network_whitelist_constraint'

class EditorConstraint
  def matches?(request)
    CBInternalNetworkWhitelistConstraint.new.matches?(request)
  end
end
