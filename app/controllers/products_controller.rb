class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  require 'paypal-sdk-rest'
  include PayPal::SDK::REST

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 # COMPRAR
  def comprar
 
    @product = Product.find(params[:id])
    @payment = Payment.new ({
      :intent => "sale",
      :payer=>  {:payment_method=>"paypal" },
      :redirect_urls => {
        :return_url => success_products_url,
        :cancel_url =>  cancel_products_url
      },
      :transactions => [{
        # Item List
        :item_list=> {:items => [{
          :name => @product.name,
          :sku => "item",
          :price => @product.price,
          :currency =>"MXN",
          :quantity =>1
        }]},
        :amount => {
         :total => @product.price,
         :currency => "MXN"
        },
        :description => "This is the payment transaction description."
      }]
    })
 
    # Create Payment and return status
    if @payment.create
      # Redirect the user to given approval url
      @redirect_url = @payment.links.find{ |v| v.method == "REDIRECT" }.href 
      redirect_to @redirect_url
    else
        render json: @payment.error
    end
  end

   # EXCECUTE
   def execute
   end

    # PAYMENTS
   def payments
   end

    # SUCCESS
   def success
      payment = Payment.find(params[:paymentId])

      if payment.execute( :payer_id => params[:PayerID])
       # Success Message
        # Note that you'll need to `Payment.find` the payment again to access user info like shipping address
       @status = "Success"
      else
      @status = payment.error # Error Hash
      end
   end

    # CANCEL
   def cancel
   end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :description, :sale_date)
    end
end
