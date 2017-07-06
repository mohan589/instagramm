class JobsController < ApplicationController
  before_action :set_category, only: [:index, :new]
  
  def index
    @jobs = @category.jobs.all
  end
  
  def new
    @job = @category.jobs.build(job_params)
  end

  def create
    if @category.jobs.create(job_params)
      redirect_to @category, notice: "New Job been added successfully!"
    else
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end
  
  private
  def job_params
    params.require(:job).permit(:title, :description, :exp_required, :salary, :location, :company_name, :category_id)
  end
  
  def set_category
    @category = Category.find(params[:category_id])
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end
