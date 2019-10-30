class ApplicationController < ActionController::Base
  def save_and_render_owner
    if @owner.save
      @wallets = Wallet.all
      flash.now[:notice] = 'Owner was successfully created.'
      render partial: 'wallets/index'
    else
      render partial: 'layouts/owner_form', status: :unprocessable_entity
    end
  end
end
