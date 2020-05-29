class SearchFacade < BaseFacade
  def initialize(search_params)
    book_json = OpenLibraryService.new.search_by_title(search_params[:title])
    review_json = NytBookService.new.search_by_title(search_params[:title])
    @book = Book.new(title: searchparams[:title],)
  end

end
