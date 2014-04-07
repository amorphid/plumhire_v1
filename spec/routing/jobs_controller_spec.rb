require "spec_helper"

describe JobsController do
  it do
    should route(:get, "/jobs/new").to(
      controller: "jobs",
      action:     "new"
    )
  end
end
