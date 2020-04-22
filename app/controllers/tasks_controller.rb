# frozen_string_literal: true

class TasksController < ApplicationController
  include SessionsHelper
  before_action :find_task, only: %i[edit update destroy]

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
    if session[:user_id].present?
      @tasks = @tasks.where(user_id: session[:user_id])
    end
    if params[:order].in?(order_whitelist) || params[:degree].in?(degree_whitelist)
      @tasks = @tasks.order_by_time(params[:order]).order_by_priority(params[:degree])
    end
    @tasks = @tasks.limit(5).page(params[:page])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    task_degree
    if @task.save
      redirect_to tasks_path, notice: (t :task_created_successful)
    else
      render :new
    end
  end

  def edit
    @task.user_id = session[:user_id]
    task_degree
  end

  def update
    @task.user_id = session[:user_id]
    task_degree
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
    params.require(:task).permit(:title, :end_time, :content, :state, :priority, :degree, :user_id)
  end

  def order_params
    params.permit(:order).tap do |ps|
      ps.delete(:order) unless ps[:order].in?(%w[end_time created_at])
    end
  end

  def degree_params
    params.permit(:degree).tap do |ps|
      ps.delete(:degree) unless ps[:degree].in?(%w[ASC DESC])
    end
  end

  def task_degree
    tables = { "#{t :low}": 1, "#{t :medium}": 2, "#{t :high}": 3 }
    @task.degree = tables[@task.priority.to_sym] if @task.priority.present?
  end

  def order_whitelist
    %w[end_time created_at]
  end

  def degree_whitelist
    %w[ASC DESC]
  end

  def find_task
    @task = Task.find(params[:id])
  rescue StandardError
    redirect_to tasks_path, notice: (t :cant_find_task)
  end
end
