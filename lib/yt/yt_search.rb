module Yt
  class YtSearch
    def self.search(arg)
      client, youtube = self.client

      begin
        # Call the search.list method to retrieve results matching the specified
        # query term.
        search_response = client.execute!(
          :api_method => youtube.search.list,
          :parameters => {
            :part => 'snippet',
            :q => arg,
            :maxResults => 25
          }
        )

        videos = []

        # Add each result to the appropriate list, and then display the lists of
        # matching videos, channels, and playlists.
        search_response.data.items.each do |search_result|
          case search_result.id.kind
            when 'youtube#video'
              videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
          end
        end

        return videos

      rescue Google::APIClient::TransmissionError => e
        puts e.result.body
      end
    end

    def self.client
      client = Google::APIClient.new(
        :key => '',
        :authorization => nil,
        :application_name => '',
        :application_version => '1.0.0'
      )

      youtube = client.discovered_api('youtube', 'v3')

      return client, youtube
    end
  end
end
