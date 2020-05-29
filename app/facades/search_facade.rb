class SearchFacade < BaseFacade
  def initialize(search_params)
    review_json = NytBookService.new.search_by_title(search_params[:title])
    book_json = OpenLibraryService.new.search_by_title(search_params[:title])
    @book = BookSerializer.injest(book_json)
    @reviews = ReviewSerializer.injest(review_json)
  end

end
