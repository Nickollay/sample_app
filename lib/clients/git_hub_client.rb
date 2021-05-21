class GitHubClient
  ACCESS_TOKEN = ENV['GITHUB_TOKEN'].freeze

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
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
