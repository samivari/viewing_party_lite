class MovieService

  def self.top_rated
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params["api_key"] = ENV['movie_api_key']
    end

    response = conn.get("3/movie/top_rated")
  
    json = JSON.parse(response.body, symbolize_names: true)
  end



  def search_movie
  end


end
