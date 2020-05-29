class SearchFacade < BaseFacade
  def initialize(search_params)
    book_json = OpenLibraryService.new.search_by_title(search_params[:title])
    review_json = NytBookService.new.search_by_title(search_params[:title])
    @book = Book.injest(book_json)
    @reviews = Reviews.injest(review_json)
  end

end
