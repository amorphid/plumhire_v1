class JobsController < ApplicationController
  before_action :authorize

  def new
    @j = Job.new
  end

  def show
    @j = Job.find_by(uuid: params[:id])
  end

  def update
    @j = Job.find_or_initialize_by(uuid: params[:id])

    if @j.update(job_params)
      flash[:success] = "Your job has been created"
      redirect_to job_path(@j)
    else
      render action: "new"
    end
  end

  private

  def job_params
    params[:job].permit(:title, :body)
  end
end
