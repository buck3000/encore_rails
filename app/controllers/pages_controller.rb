class PagesController < ApplicationController
  def index
  end

  def search
    band_name = params[:band]
    mbid = Musicbrainz.search(band_name)
    @results = Setlist.search(band_name, mbid)
    p @results
  end

  def search_youtube
    band = params[:search][:band]

    search_params = params[:search][:concert].split(', ')

    date, tour, venue, city, state = search_params
    puts "#{date}, #{tour}, #{venue}, #{city}, #{state}"
    search1 = "#{band}, #{venue}, #{state}, #{date}"
    p search1
    search2 = "#{band}, #{venue}, #{date}"
    p search2
    search3 = "#{band}, #{state}, #{date}"
    p search3

    # @band = Band.create(params[:band])
    # venue = Venue.create(params[:venue])

    # @concert = @user.concerts.build(params[:concert].merge(band_id: @band.id, venue_id: venue.id))

    @titles_ids = {}

    results = []

    # if @concert.save
    results << Youtube.search(search1)
    results << Youtube.search(search2)
    results << Youtube.search(search3)

    p results
    results.flatten!.uniq!

    results.each do |result|
      if result =~ /\(\w*\)\z/
        title = result.gsub(/ \(\w*\)\z/, '')
        @titles_ids[title] = result[/\(\w*\)\z/].gsub(/\(*\)*/, '')
        # @ids << result[/\(\w*\)\z/].gsub(/\(*\)*/, '')
      end
    end

    render :search_youtube
  end
end
