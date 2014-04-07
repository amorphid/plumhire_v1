class JobsController < ApplicationController
  def new
    @j = Job.new
  end
end
