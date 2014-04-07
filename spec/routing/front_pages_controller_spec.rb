require "spec_helper"

describe FrontPagesController do
  it do
    should route(:get, "/").to(
      controller: "front_pages",
      action:     "index"
    )
  end
end
