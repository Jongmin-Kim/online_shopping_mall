class ChargesController < ApplicationController
  def index
    @charges = Charge.all
  end

  def new
  end

  def create
    @product = Product.find(1)
    Charge.create(amount: @product.price, time: Time.now)

    # Amount in cents
    @amount = @product.price

    customer = Stripe::Customer.create(
      :email => 'example.stripe.com',
      :card => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer => customer.id,
      :amount => @amount, 
      :description => 'Rails Stripe customer', 
      :currency => 'usd'
    ) 
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
