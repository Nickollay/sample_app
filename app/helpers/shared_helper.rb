module SharedHelper
  def current_year
    Time.now.year
  end

  def git_hub_url(author, repo)
    link_to 'Test Guru', "https://github.com/#{author}/#{repo}", target: "_blank"
  end
end
