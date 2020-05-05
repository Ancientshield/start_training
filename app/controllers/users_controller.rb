# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]
  def index
    @users = User.includes(:tasks).limit(5).page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: (t :user_created_successful)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: (t :user_edited_successful)
    else
      redirect_to users_path, notice: (t :task_deleted_failed)
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: (t :user_deleted_successful)
    else
      redirect_to users_path, notice: (t :user_deleted_failed)
  end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def find_user
    @user = User.find_by(name: params[:name])
  end
end
