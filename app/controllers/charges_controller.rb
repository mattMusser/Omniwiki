class ChargesController < ApplicationController
  require "json"

  def create
    # Amount in cents
    @amount = 1500

    # Creates a Stripe Customer object, for associating with the charge.
    customer = Stripe::Customer.create(
      :email =>  params[:stripeEmail],
      :card  =>  params[:stripeToken]
    )

    # Where the real magic happens
    @stripe_charge = Stripe::Charge.create(
      :customer    =>    customer.id, # Note -- thise is NOT the user_id in this app.
      :amount      =>    @amount,
      :description =>    "Stripe customer",
      :currency    =>    "usd"
    )

    p "stripe_charge: #{@stripe_charge}"
    @h = JSON.parse @stripe_charge.to_s
    p "h: #{@h}"
    @ch_id = @h["id"]
    p "ch_id: #{@ch_id}"

    flash[:success] = "Thanks for upgrading your account, #{current_user.email}!"
    current_user.update_attribute(:role, 'premium')
    redirect_to edit_user_registration_path

    @plan = Stripe::Plan.retrieve("premium")
    unless @plan
      plan = Stripe::Plan.create(
        :name => "Premium",
        :id => "premium",
        :interval => "month",
        :currency => "usd",
        :amount => 1500
      )

      @subscription = Stripe::Subcription.create(
        :customer => customer.id,
        :plan => "premium",
      )

      current_user.set_attribute(:role, 'premium')
    end

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

  def dpwngrade
    #current_user.update_attribute(:role, 'standard')

    @ch = Stripe::Charge.retrieve( charge: @ch_id)
    #re = Stripe::Refund.create( charge: @ch )
    puts "@ch_id: #{@ch_id}"
    puts "@ch: #{@ch}"

    #current_user.set_attribute(:role, 'standard')
    current_user.update_attribute(:role, 'standard')

    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public. You will recieve a $15.00 refund."
    redirect_to root_path
  end
end
