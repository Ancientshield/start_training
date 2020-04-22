# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create change_user]
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      if user.authority == 'admin'
        redirect_to users_path
      else
        redirect_to root_url
      end
    else
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    session[:name] = nil
    redirect_to root_url, notice: 'Logged out'
  end

  def change_user
    user = User.find_by(name: params[:name])
    # binding.pry_remote
    session[:user_id] = user.id
    session[:user_name] = user.name
    if user.authority == 'admin'
      redirect_to users_path
    else
      redirect_to root_url
    end
  end
end
