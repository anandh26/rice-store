module ActionController
  class Base
    include AdvancedBotDetection

    def menu
      @menu = Menu.all.where(status: 't')
    end

    helper_method :browser_id

    def browser_id
      return bot_browser_id if request.bot?
      cookies[:BID] ||= create_browser_id
      cookies[:BID]
    end

    private
    def bot_browser_id
      "THISISABOT12#{(Digest::MD5.hexdigest "#{SecureRandom.hex(10)}-#{DateTime.now.to_s}")}"
    end

    def create_browser_id
      {
          value: ENV['DEVELOPMENT_BID'] ||(Digest::MD5.hexdigest "#{SecureRandom.hex(10)}-#{DateTime.now.to_s}"),
          domain: :all
      }
    end
  end
end