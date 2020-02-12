class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :destroy]
  def index
    # 之後會使用kaminari分頁
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: '任務新增成功！'
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: '編輯成功！'
      else
        render :edit
    end
  end

  def destroy
    if @task.present?
      @task.destroy
      redirect_to tasks_path, notice: '刪除成功！'
    else
      redirect_to tasks_path, notice: '刪除失敗！'
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :content)
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

end
