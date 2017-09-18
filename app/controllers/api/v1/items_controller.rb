class Api::V1::ItemsController < API::V1::ApplicationController
  def index
    render json: Item.all, serializer: ItemSerializer
  end

  def show
    item = Item.find(params[:id])
    render json: item, serializer: ItemSerializer
  end

  def create
    render status: 201, json: Item.create(item_params), serializer: ItemSerializer
  end

  def destroy
    item = Item.find(params[:id])
    render status: 204, json: Item.destroy(item.id), serializer: ItemSerializer
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
