class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'

  def initialize
    @http_client = http_client
  end

  def create_gist(params)

  end

  private

  def http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
