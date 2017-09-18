class SearchController < ApplicationController
  def index
    @store_data = StorePresenter.new(zipcode)
  end
end
