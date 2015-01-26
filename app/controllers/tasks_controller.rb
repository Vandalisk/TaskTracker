class TasksController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :get_project
  before_action :get_task, only: [:show, :edit, :update, :destroy]

  def get_project
	@project = Project.find(params[:project_id])
  end

  def get_task
	@task = Task.find(params[:id])
  end

  def index	    	    		
	@tasks = @project.tasks
  end

  def show
  end

  def new		
	@task = Task.new
  end

  def edit
  end

  def create		
	@task = @project.tasks.new(task_params)

	if @task.save
	  redirect_to project_tasks_path(@project)
	else			
      render 'new'
	end
  end

  def update	
	   
    if(@task.update_attributes(task_params))
      redirect_to project_tasks_path(@project)
    else
   	  render 'edit'
	end	    
  end

  def destroy

	@task.destroy

	redirect_to project_tasks_path(@project)
  end

  private
    def task_params
      params.require(:task).permit(:title,
      :rating, :description, :customer, :performer,
      :project_id, :state)
    end		
end
