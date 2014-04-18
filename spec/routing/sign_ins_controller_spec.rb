require "spec_helper"

describe SignInsController do
  it do
    should route(:get, "/sign_ins/new").to(
      controller: "sign_ins",
      action:     "new"
    )
  end
end
