class NytBookService < BaseService
  def initialize
    @endpoint = "https://api.nytimes.com/svc/books/v3"
  end

  def search_by_title(title)
    get_json("reviews.json", {"title": title})
  end

  private
  def get_json(url, params)
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: @endpoint) do |f|
      f.params["api-key"] = ENV["API_KEY"]
    end
  end
end
