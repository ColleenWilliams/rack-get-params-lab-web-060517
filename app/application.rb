class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



    if req.path.match(/cart/)
          if @@cart.empty?
            resp.write "Your cart is empty"
          else
            @@cart.each do |item|
            resp.write "#{item}\n"
          end
        end
    elsif req.path.match(/add/)
        add_term = req.params["item"]
        if @@items.include?(add_term)
          @@cart.push(add_term)
          resp.write "added #{add_term}"
        else
          resp.write "We don't have that item"
        end
    else
      resp.write "Path Not Found"
    end
    resp.finish
  end

end


#   def handle_search(search_term)
#     if @@cart.include?(search_term)
#       return "#{search_term} is one of our cart"
#     else
#       return "We don't have that item"
#     end
#   end
# end
