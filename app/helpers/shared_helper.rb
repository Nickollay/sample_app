module SharedHelper
  def current_year
    Time.current.year
  end

  def git_hub_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}"
  end
end
