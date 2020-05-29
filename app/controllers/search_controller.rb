class SearchController < ApplicationController
  def index
    @searchresults = SearchFacade.new(search_params)
  end
private
  def search_params
    params.permit(:title)
  end
end
