module Services
  module Responses
    class RegistrationResponse < Struct.new(:status, :error_message, :user)
      def successful?
        status == 'Success'
      end
    end
  end
end
