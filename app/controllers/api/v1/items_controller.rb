class Api::V1::ItemsController < API::V1::ApplicationController
  def index
    render json: Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_back fallback_location: { action: show, id: item.id }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
