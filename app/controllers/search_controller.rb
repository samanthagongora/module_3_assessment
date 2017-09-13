class SearchController < ApplicationController
  def index
    @stores = Store.find(params[:q])
  end
end
