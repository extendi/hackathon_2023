require 'net/http'
require 'json'
uri = URI('https://stg.locatorapi.io/api/graphql')
params = { query: '
query { poisByDistance(input: { distance: 93000, latitude: 40.0524, longitude: 15.8343, limit: 10 }  ) {
id
} }
' }
headers = {
  'Authorization'=>'Bearer token',
  'Content-Type' => 'application/json',
  'Accept' => 'application/json'
}

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true
response = https.post(uri.path, params.to_json, headers)
puts response.body
