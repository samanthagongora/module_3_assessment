class Store
  attr_reader :long_name, :store_type, :city, :distance, :phone_number

  def initialize(data)
    @long_name = data[:longName]
    @city = data[:city]
    @distance = data[:distance]
    @phone_number = data[:phone]
    @store_type = data[:storeType]
  end

  def self.find(zipcode)
    stores = BestBuyService.find_stores(zipcode)
    stores.map do |raw_data|
      Store.new(raw_data)
    end
  end
end
