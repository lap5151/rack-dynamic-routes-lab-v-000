require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)


  if req.path.match(/items/)
    item = req.path.split("/")
    search_item = item[2]
    #binding.pry
    if @@items.include?(search_item)
      resp.write "#{item.price}"
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
