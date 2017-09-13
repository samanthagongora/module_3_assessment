class Store
  def initialize(data)
    @long_name = data[:longname]
    @city = data[:city]
    @distance = data[:distance]
    @phone_number = data[:phone]
    @store_type = data[:storetype]
  end

  def self.find(zipcode)
    @conn = Faraday.new(:url => 'https://api.bestbuy.com')
    @response = @conn.get "/v1/stores(area(#{zipcode},25))?format=json&apiKey=#{ ENV['MY_KEY']}"
    stores = JSON.parse(@response.body, :symbolize_names => true)[:stores]
    stores.map do |raw_data|
      Store.new(raw_data)
    end
  end
end
