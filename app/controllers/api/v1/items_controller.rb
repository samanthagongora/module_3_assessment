class Api::V1::ItemsController < ApplicationController
  def index
    items = Item.all
    render json: { items.as_json(except: [:created_at, :updated_at]) }
  end
end
