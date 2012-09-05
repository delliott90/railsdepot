#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class LineItemsController < ApplicationController
  

  
  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])
    puts "\n HERE BE SOME TEXT \n"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.xml
  def new
    @line_item = LineItem.new
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.xml
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    @line_item.product = product

    respond_to do |format|
      if @line_item.save
        session[:counter] = 0 # reset the number of store visits
        format.html { redirect_to(store_url) }
        format.js { @current_item = @line_item }
        format.json  { render :json => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'Line item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def destroy
    Rails.logger = Logger.new(STDOUT)
    line_item = LineItem.find(params[:id])
      @quantity = 16
    # @line_item.destroy
    logger.info "QUANTITY =  #{line_item.quantity}"
    logger.info "ANOTHER QUANTITY = #{@quantity}"
   if line_item.quantity > 1
     line_item.quantity -= 1
      #@line_item.quantity -= 1
    end
   # Otherwise remove the line_item
   # else
      # @line_item.destroy
   # end


    respond_to do |format|
      format.html { redirect_to(store_url) }
      format.xml  { head :ok }
    end
  end
  
  
    # DELETE /line_items/1
  # DELETE /line_items/1.xml
  def testy
    puts "\n TESTY \n"
   # @cart = current_cart
   # product = Product.find(params[:product_id])
   # @cart.remove_product(product.id)
   format.html { redirect_to(store_url) }
  end

  

  
end