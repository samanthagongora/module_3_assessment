class Api::V1::ItemsController < API::V1::ApplicationController
  def index
    render json: Item.all, except: [:created_at, :updated_at]
  end

  def show
    item = Item.find(params[:id])
    render json: item, except: [:created_at, :updated_at]
  end

  def create
    render json: Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
