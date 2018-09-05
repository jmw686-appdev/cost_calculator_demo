class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params.fetch("id"))
  end

  def edit; end

  def destroy; end
end
