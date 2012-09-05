module ApplicationHelper
  
  # condition is true if line_items are empty
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      #attributes["style"] = "display: none"
   puts "Blah"
      
    end
    content_tag("div", attributes, &block)
  end
  
end
