class Store
  attr_reader :long_name, :store_type, :city, :distance, :phone_number

  def initialize(data)
    @long_name = data[:longName]
    @city = data[:city]
    @distance = data[:distance]
    @phone_number = data[:phone]
    @store_type = data[:storeType]
  end
end
