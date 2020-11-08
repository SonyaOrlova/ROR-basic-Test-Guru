module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def flash_messages
    safe_join(flash.map { |type, message| content_tag :p, message.html_safe, class: "flash_#{type}" })
  end

  def main_page_path
    current_user.admin? ? admin_tests_path : root_path
  end
  
  def global_locale
    @translations ||= I18n.backend.send(:translations)
    @translations[I18n.locale].with_indifferent_access
  end
end
