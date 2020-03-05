# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]
  def index
    # 之後會使用kaminari分頁
    # binding.pry
    @tasks = Task.order(params[:order])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      task_notice '任務新增成功！'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      task_notice '編輯成功！'
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      task_notice '刪除成功！'
    else
      task_notice '刪除失敗！'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :end_time, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  rescue StandardError
    task_notice '找不到任務喔！'
  end

  def task_notice(msg)
    redirect_to tasks_path, notice: msg.to_s
  end
end
