# frozen_string_literal: true

# users controller class for communicating between views and model
# @Ref 1: https://www.youtube.com/watch?v=8UIG9Ggu9Q4
# Reference Description - How to Add Devise Users and Admins to a Rails App
# @Ref 2 - https://www.youtube.com/watch?v=7v2EMmfBJL8
# Ref Description - User And Admin Accounts With Devise tutorial
class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

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
