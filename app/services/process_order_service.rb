class ProcessOrderService < BaseService
  require 'net/http'

    URL = URI(ENV['API_URL']).freeze
  
  def call(payload)
    uri = URI(URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
  
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
    request['Content-Type'] = 'application/json'
    request['X-Sent'] = Time.zone.now.strftime('%Hh%M - %d/%m/%y')
    request.body = payload
  
    response = http.request(request)  
    response.code == '200'
  end
    
end