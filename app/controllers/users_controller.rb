class UsersController < ApplicationController
  def create
    @owner = User.new(user_params)
    save_and_render_owner
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
