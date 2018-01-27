# Client class to fetch data from KEC site
class KecClient
  BASE_URL = 'http://api.klinyenglish.pl'.freeze
  def initialize(options = {})
    @auth_token = options[:auth_token] || Rails.application.secrets.kec_auth_token
  end

  def marks(group_id)
    request("marks_by_group/#{group_id}/")
  end

  def lessons(group_id)
    request("lessons_by_group/#{group_id}/")
  end

  def groups
    request('groups/')
  end

  private

  def request(path)
    response = RestClient::Request.execute(method: :get,
                                           url: [BASE_URL, path].join('/'),
                                           headers: { 'Auth-Token' => @auth_token })
    JSON.parse(response.body)
  rescue StandardError => e
    puts e.message
  end
end
