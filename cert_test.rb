require 'net/http'
require 'net/https'
require 'uri'

url = URI.parse('https://staging.newrelic.com/')

http = Net::HTTP.new(url.host, 443)

http.use_ssl = true
OpenSSL.debug = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER
#marina adding
http.ca_path = '/etc/ssl/certs' if File.exists?('/etc/ssl/certs') # Ubuntu
http.ca_file = '/home/qauser/newrelic/ruby_agent/cert/cacert.pem'

request = Net::HTTP::Get.new(url.path)
response = http.request(request)
puts response
