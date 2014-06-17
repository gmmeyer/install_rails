class UsersController < ApplicationController
  def new
    unauthorized! if cannot? :manage, @user

    @user = User.new
  end

  def create
    unauthorized! if cannot? :manage, @user

  end

  def edit
    unauthorized! if cannot? :manage, @user
  end

  def update
    unauthorized! if cannot? :manage, @user
  end
end
