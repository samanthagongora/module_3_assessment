class SearchController < ApplicationController
  def index
    @store_data = StorePresenter.new(params[:q])
  end
end
