class Api::V1::ItemsController < API::V1::ApplicationController
  def index
    render json: Item.all
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to api_v1_item_path(item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end

end
