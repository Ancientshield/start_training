# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]
  def index
    # 之後會使用kaminari分頁
    @tasks = Task.order('created_at ASC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      task_notice (I18n.t :'task.add_success').to_s
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      task_notice (I18n.t :'task.edit_success').to_s
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      task_notice (I18n.t :'task.deiete_success').to_s
    else
      task_notice (I18n.t :'task.delete_fail').to_s
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  rescue StandardError
    task_notice (I18n.t :'task.not_found').to_s
  end

  def task_notice(msg)
    redirect_to tasks_path, notice: msg.to_s
  end
end
