class SearchController < ApplicationController
  def index
    @searchresults = SearchFacade.new(search_params)
  end

end
