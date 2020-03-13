# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]
  def index
    # 之後會使用kaminari分頁
    # binding.pry
    @q = Task.search(params[:q])
    @tasks = if params[:state].present?
               Task.where('state LIKE ?', params[:state].to_s)
             elsif params[:priority].present?
               Task.where('priority LIKE ?', params[:priority].to_s)
             elsif params[:order].present?
               Task.order(params[:order])
             elsif params[:query_string].present?
               Task.where('title ILIKE ?', "%#{params[:query_string]}%")
             elsif
               @q = Task.ransack(params[:q])
               @tasks = @q.result
             else
               Task.all
             end
    @tasks = @tasks.limit(3).page(params[:page])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: (t :task_created_successful).to_s
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: (t :task_edited_successful).to_s
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: (t :task_deleted_successful).to_s
    else
      redirect_to tasks_path, notice: (t :task_deleted_failed).to_s
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :end_time, :content, :state, :priority)
  end

  def find_task
    @task = Task.find(params[:id])
  rescue StandardError
    redirect_to tasks_path, notice: (t :cant_find_task).to_s
  end
end
