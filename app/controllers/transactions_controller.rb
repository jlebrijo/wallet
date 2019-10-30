class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @kind = params[:kind]
    render partial: 'form'
  end

  def create
    @transaction = Transaction.new(user_params)
    if @transaction.save
      @wallets = Wallet.all
      flash.now[:notice] = "#{@transaction.kind.capitalize} was successfully created."
      render partial: 'wallets/index'
    else
      @kind = @transaction.kind
      render partial: 'form', status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:transaction).permit(:source_id, :target_id, :amount)
  end
end
