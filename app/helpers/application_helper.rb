module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(title, author, repo)
    link_to title, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
