class Cart < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :line_items, :dependent => :destroy
  
  # If product is already in the cart increment the line_item quantity by 1 
  def add_product(product_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
  # Otherwise create a new line_item
    else
      current_item = LineItem.new(:product_id=>product_id)
      line_items << current_item # add the current_item to the end of the line_items
    end
    current_item
  end
  
  
  #def remove_product(product_id)
  def remove_product(current_item)
    if current_item.quantity > 1
      current_item.quantity -= 1
    # Otherwise remove the line_item
    else
      current_item.destroy
    end
    current_item.save
  end
  
  # total price of all products in cart
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  # total number of items in the cart
  def total_items
    line_items.sum(:quantity)
  end
  
end
