class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    search_item = req.params["q"]

  if req.path.match(/items/)
    if @@items.include?(search_item)
      resp.write "#{item.price}\n"
    else
      resp.write "Item not found"
      resp.status = 400
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end

    resp.finish
  end
end
