class Api::V1::ItemsController < API::V1::ApplicationController
  def index
    render json: Item.all
  end
end
