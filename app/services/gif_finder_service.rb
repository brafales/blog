class GifFinderService
  attr_reader :term

  def initialize(term)
    @term = term
  end

  def run
    search_gif
  end

  private

  def search_gif
    api_instance = GiphyClient::DefaultApi.new

    api_key = ENV['GIPHY_API_KEY']

    q = term

    opts = { 
      limit: 25, # Integer | The maximum number of records to return.
      offset: 0, # Integer | An optional results offset. Defaults to 0.
      rating: "g", # String | Filters results by specified rating.
      lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }

    #Search Endpoint
    result = api_instance.gifs_search_get(api_key, q, opts)
    result.data.sample.images.fixed_height.url
  end
end
