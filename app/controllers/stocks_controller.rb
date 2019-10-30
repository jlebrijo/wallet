class StocksController < ApplicationController
  def create
    @owner = Stock.new(user_params)
    save_and_render_owner
  end

  private
  def user_params
    params.require(:stock).permit(:name)
  end
end
