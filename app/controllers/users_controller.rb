# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find_by(name: params[:name])
  end

  def new; end

  def create; end

  def edit; end

  def update; end
end
