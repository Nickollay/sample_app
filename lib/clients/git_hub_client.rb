class GitHubClient
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
     Faraday.new(url: ROOT_ENDPOINT) #do |conn|
  end
end
