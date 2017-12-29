class DowngradeController < ApplicationController
  def new
  end

  def create
    current_user.update(role: 0)

    ch = Stripe::Charge.retrieve( charge: params[:charge_id].id )
    re = Stripe::Refund.create( charge: ch )

    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public. You will recieve a $15.00 refund."
    redirect_to root_path
  end
end
