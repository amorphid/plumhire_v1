class JobsController < ApplicationController
  def new
    @j = Job.new
  end

  def update
    @j = Job.find_or_initialize_by(uuid: params[:id])
    @j.update(job_params)
    render action: "new"
  end

  private

  def job_params
    params[:job].permit(:title, :body)
  end
end
