# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[edit update destroy]
  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
    @tasks = @tasks.order("#{params[:order]} ASC") if params[:order].present?
    @tasks = @tasks.limit(3).page(params[:page])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: (t :task_created_successful)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: (t :task_edited_successful)
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: (t :task_deleted_successful)
    else
      redirect_to tasks_path, notice: (t :task_deleted_failed)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :end_time, :content, :state, :priority)
  end

  def find_task
    @task = Task.find(params[:id])
  rescue StandardError
    redirect_to tasks_path, notice: (t :cant_find_task)
  end
end
