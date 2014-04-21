module ApplicationHelper
  def mobile_browser?
    browser    = request.env["HTTP_USER_AGENT"]
    user_agent = UserAgent.parse(browser)
    user_agent.mobile?
  end

  def page_title(title)
    provide(:title, title)
  end
end
