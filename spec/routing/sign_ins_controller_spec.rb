require "spec_helper"

describe SignInsController do
  it do
    should route(:get, "/sign_ins/new").to(
      controller: "sign_ins",
      action:     "new"
    )
  end

  it do
    should route(:put, "/sign_ins/1").to(
      controller: "sign_ins",
      id:         "1",
      action:     "update"
    )
  end
end
