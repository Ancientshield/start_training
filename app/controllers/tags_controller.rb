# frozen_string_literal: true

class TagsController < ApplicationController
  include SessionsHelper
  before_action :find_tag, only: %i[destroy]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tasks_path, notice: '新增標籤成功'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
      redirect_to tasks_path, notice: '標籤更新'
    else
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      redirect_to tasks_path, notice: '標籤刪除'
    else
      redirect_to tasks_path, notice: '標籤刪除失敗'
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  rescue StandardError
    redirect_to tasks_path, notice: '找不到標籤！'
  end
end
