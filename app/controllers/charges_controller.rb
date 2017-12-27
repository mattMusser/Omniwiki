class ChargesController < ApplicationController
  def create
    # Amount in cents
    @amount = 1500

    # Creates a Stripe Customer object, for associating with the charge.
    customer = Stripe::Customer.create(
      :email =>  params[:stripeEmail],
      :card  =>  params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      :customer    =>    customer.id, # Note -- thise is NOT the user_id in this app.
      :amount      =>    @amount,
      :description =>    "Stripe customer",
      :currency    =>    "usd"
    )

    flash[:success] = "Thanks for the upgrading, #{current_user.email}!"
    current_user.update_attribute(:role, 'premium')
    redirect_to edit_user_registration_path

    Stripe::Subscription.create(
      :customer => customer.id,
      :plan     => "premium"
    )

    current.user.set_attribute(:role, 'premium')

    # Stripe will send back CardErrors, with friendly messages.
    # when something goes wrong.
    # This 'rescue block' catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key:         "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Omnipedia Membership - #{current_user.email}",
      amount:      @amount
    }
  end


end
