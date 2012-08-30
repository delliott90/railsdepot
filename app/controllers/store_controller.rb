class StoreController < ApplicationController
  def index
    @products = Product.all
    @sessioncnt = sessioncount
  end
  
 
  
  def sessioncount
    if session[:counter].nil?
      session[:counter] = 0
    end
      session[:counter] += 1
      return session[:counter]
  end
    
  

end
