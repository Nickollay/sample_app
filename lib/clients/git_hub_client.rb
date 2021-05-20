class GitHubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = client
  end

  def create_gist(params)
    client.create_gist(params)

    # http_client.post('gists', params) do |request|
    #   request.headers[:authorization] ="token #{ACCESS_TOKEN}"
    #   request.headers[:content_type] = 'application/json'
    #   request.body = params.to_json
    # end
  end

  private

  def client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end
end
