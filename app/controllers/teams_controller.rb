class TeamsController < ApplicationController
  def create
    @owner = Team.new(user_params)
    save_and_render_owner
  end

  private
  def user_params
    params.require(:team).permit(:name)
  end
end
