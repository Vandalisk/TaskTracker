class TasksController < ApplicationController
	before_action :get_project

	def get_project
		@project = Project.find(params[:project_id])
	end

	def index	    	    		
		@tasks = @project.tasks
	end

	def show		 
		@task = Task.find(params[:id])			
	end

	def new		
		@task = Task.new
	end

	def edit
		@task = Task.find(params[:id])
	end

	def create		
		@task = @project.tasks.create(task_params)

		if @task.save
		  redirect_to project_tasks_path(@project)
		else			
			render 'new'
		end
	end

	def update
	   @task = Task.find(params[:id])
	    if(@task.update_attributes(task_params))
	    	redirect_to project_tasks_path(@project)
	    else
	    	render 'edit'
	    end	    
	end

	def destroy
		@task = Task.find(params[:id])
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
