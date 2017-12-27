class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
      key:         "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Omnipedia Membership - #{current_user.email}",
      amount:      @amount
    }
  end

  def create
    @amount = 50

    # Creates a Stripe Customer object, for associating with the charge.
    customer = Stripe::Customer.create(
      email: current_user.email,
      card:  params[:stipeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
      customer:    customer.id, # Note -- thise is NOT the user_id in this app.
      amount:      @amount,
      description: "Stripe customer",
      currency:    'usd'
    )

    flash[:success] = "Thanks for all the money, #{current_user.email}! Feel free to give me all your money next time."
    redirect_to user_path(current_user) # or wherever

    # Stripe will send back CardErrors, with friendly messages.
    # when something goes wrong.
    # This 'rescue block' catches and displays those errors.
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
    end
end
