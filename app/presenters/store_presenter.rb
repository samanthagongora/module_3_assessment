class StorePresenter
  attr_reader :stores, :total_stores
  def initialize(zipcode)
    store_data(zipcode)
  end

  def store_data(zipcode)
    data = BestBuyService.find_stores(zipcode)
    bundle_data(data)
  end

  def bundle_data(data)
    @stores = data[:stores].map do |raw_data|
      Store.new(raw_data)
    end
    @total_stores = data[:total]
  end
end
