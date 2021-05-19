class GitHubClient
  # require 'faraday'
  # # require 'faraday_middleware'
  # require 'faraday_json'

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = http_client
  end

  def create_gist(params)
    http_client.post('gists', params) do |request|
      #if errors - probably change to strings
      request.headers[:authorization] ="token #{ACCESS_TOKEN}"
      # request.headers[:content_type] = 'application/json'
      request.headers[:content_type] = 'application/json'
      # binding.pry
      request.body = params.to_json
    end
  end

  private

  def http_client
    # binding.pry
     Faraday.new(url: ROOT_ENDPOINT) #do |conn|
     # Octokit::Client.new(access_token: ACCESS_TOKEN)
    #   conn.request :json
    #   conn.response :json
    #
    #   conn.adapter Faraday.default_adapter
    # end
  end
end
