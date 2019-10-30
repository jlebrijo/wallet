class WalletsController < ApplicationController
  def index
    @wallets = Wallet.all
  end

  def new
    @owner = params[:owner_type].constantize.new
    render partial: 'layouts/owner_form'
  end
end