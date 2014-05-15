client = Google::APIClient.new(
  :key => ENV['DEVELOPER_KEY'],
  :authorization => nil,
  :application_name => ENV['PROGRAM_NAME'],
  :application_version => '1.0.0'
)

youtube = client.discovered_api(ENV['YOUTUBE_API_SERVICE_NAME'], ENV['YOUTUBE_API_VERSION'])
