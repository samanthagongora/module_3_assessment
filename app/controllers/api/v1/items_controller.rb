class Api::V1::ItemsController < API::V1::ApplicationController
  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    render status: 201, json: Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    render status: 204, json: Item.destroy(item.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
