require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



  if req.path.match(/items/)
    search_item = req.params["q"]
    if @@items.include?(search_item)
      resp.write "#{item.price}\n"
      binding.pry
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
