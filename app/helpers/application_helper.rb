module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(title, author, repo)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_messages
    safe_join(flash.map { |type, message| content_tag :p, message.html_safe, class: "flash_#{type}" })
  end

  def main_page_path
    current_user.admin? ? admin_tests_path : root_path
  end
end
