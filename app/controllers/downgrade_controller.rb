class DowngradeController < ApplicationController
  def new
  end

  def create
    current_user.update(role: 'standard')
    re = Stripe::Refund.create(
    charge: "ch_1CD2TBC9ne8Id87DHHXyMef2"
    )

    flash[:notice] = "Your account has been downgraded to a standard account. Your private wikis are now public. You will receive a $15.00 refund."
    redirect_to root_path
  end
end
