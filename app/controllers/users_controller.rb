# frozen_string_literal: true

# users controller class for communicating between views and model
# @Ref: https://www.youtube.com/watch?v=8UIG9Ggu9Q4
class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user.id), notice: 'You successfully updated your profile.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end
end
