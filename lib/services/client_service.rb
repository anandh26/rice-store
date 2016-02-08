module Services
  class ClientService
    attr_reader :request

    def initialize(request)
      @request = request
    end

    def find_by_email
      User.find_by(email: request[:email])
    end

    def find_by_email_and_password
      User.find_by(email: request[:email], password: request[:password])
    end

  end
end
