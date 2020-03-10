# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]
  def index
    # 之後會使用kaminari分頁
    # binding.pry
    @tasks = if params[:state].present?
               Task.where('aasm_state LIKE ?', params[:state].to_s)
             elsif params[:order].present?
               Task.order(params[:order])
             else
               Task.all
             end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      task_notice { t :task_created_successful }
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      task_notice { t :task_edited_successful }
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      task_notice { t :task_deleted_successful }
    else
      task_notice { t :task_deleted_failed }
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :end_time, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  rescue StandardError
    task_notice { t :cant_find_task }
  end

  def task_notice(msg)
    redirect_to tasks_path, notice: msg.to_s
  end
end
