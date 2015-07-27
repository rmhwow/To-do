class TasksController < ApplicationController
  def index
   @tasks = Task.all
  end

  def show
    @tasks = Task.all
    @task = Task.find(params[:id])
    # @user = User.find(params[:user_id])
    @task.user = @user
  end

  def new
    @task = Task.new
    @user = User.find(params[:user_id])

  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @task
    else 
      flash[:error] = "Error saving your task. Please try again"
      render :edit
    end
  end

   def destroy
      @task = Task.find(params[:id])
      if @task.destroy
         flash[:notice] = "\"#{@task.body}\" was deleted successfully."
       redirect_to tasks_path
      else
        flash[:error] = "There was an error deleting the topic."
       render :show
      end
   end

  def create
    @task = Task.new(task_params)
     if @task.save
       redirect_to @task, notice: "Task was saved successfully."
     else
       flash[:error] = "Error creating task. Please try again."
       render :new
     end
  end

  def task_params
  params.require(:task).permit(:body)
end
end
