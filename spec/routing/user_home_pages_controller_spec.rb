require "spec_helper"

describe UserHomePagesController do
  it do
    should route(:get, "/user_home_pages/1/").to(
      controller: "user_home_pages",
      id:         "1"
    )
  end
end
