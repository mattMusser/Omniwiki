class UsersController < ApplicationController
  before_action :authenticate_user!, except: :show
  def show
    @user = User.friendly.find(params[:id])
  end
end
