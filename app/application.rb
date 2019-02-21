class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    search_item = req.params["q"]
    
  if req.path.match(/items/)
    if @@items.include?(search_item)
      resp.write "#{search_item} is one of our items"
    else
      resp.write "Item not found"
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end

    resp.finish
  end
end
