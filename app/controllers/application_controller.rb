class ApplicationController < ActionController::Base
  before_action :menu, :create_visitor_id
  protect_from_forgery except: :create

  def menu
    @menu = Menu.all.where(status: 't')
  end

  def create_visitor_id
    return if request.bot?
    current_visitor = Visitor.find_by(browser_id: browser_id)
    if current_visitor.nil?
      @vid = create_visitor
    else
      @vid = current_visitor
    end
  end

  def create_visitor
    visitor = Services::VisitorService.new(browser_id, request).visitor_id
    visitor.user
  end
end
