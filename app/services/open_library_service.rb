class OpenLibraryService < BaseService
  def initialize
    @endpoint = "http://openlibrary.org/"
  end

  def search_by_title(title)
    get_json("search.json", {"title": title})
  end

  private
  def conn
    Faraday.new(url: @endpoint)
  end
end
