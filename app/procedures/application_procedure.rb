class ApplicationProcedure
  attr_accessor :controller, :request

  def initialize(controller = nil, request = nil)
    @controller = controller
    @request = request
    clear_old_reveal_data unless controller.nil?
  end

  def params
    controller.params
  end

  def session
    controller.session
  end

  def method_missing(*args, &block)
    controller.send(*args, &block)
  end

  def append_api_reveal(reveal_object)
    api_reveal.push(hashify_reveal_object(reveal_object))
  end

  def reveal_block
    return method(:append_api_reveal) if should_reveal?
  end

  private

  def api_reveal
    session[:api_reveal]
  end

  def clear_old_reveal_data
    session[:api_reveal] = []
  end

  def hashify_reveal_object(reveal_object)
    return {} unless reveal_object.is_a? Cb::Models::ApiCall
    {
      type: reveal_object.api_call_type.to_s,
      path: reveal_object.path,
      options: fix_options(reveal_object.options),
      response: reveal_object.response.to_h
    }
  end

  def fix_options(options)
    return {} if options.nil?
    {
      query: options[:query],
      headers: options[:headers],
      body: options[:body]
    }
  end
end
