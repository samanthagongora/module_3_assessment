class Store
  def self.find(zipcode)
    @conn = Faraday.new(:url => 'https://api.bestbuy.com')
    @response = @conn.get "/v1/stores(area(#{zipcode},25))?format=json&apiKey=#{ ENV['MY_KEY']}"
    stores = JSON.parse(@response.body, :symbolize_names => true)[:stores]
    
  end
end
