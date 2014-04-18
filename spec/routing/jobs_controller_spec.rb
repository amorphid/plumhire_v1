require "spec_helper"

describe JobsController do
  it do
    should route(:get, "/jobs/new").to(
      controller: "jobs",
      action:     "new"
    )
  end

  it do
    should route(:put, "/jobs/1").to(
      controller: "jobs",
      id:         "1",
      action:     "update"
    )
  end
end
