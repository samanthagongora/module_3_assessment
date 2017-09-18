class BestBuyService
  def initialize(zipcode)
    @zipcode = zipcode
    @conn = Faraday.new(:url => 'https://api.bestbuy.com')
  end

  def find_stores
    response = @conn.get(get_url_stores)
    JSON.parse(response.body, :symbolize_names => true)
  end

  def get_url_stores
    "/v1/stores(area(#{@zipcode},25))?format=json&apiKey=#{ ENV['MY_KEY']}"
  end

  def self.find_stores(zipcode)
    new(zipcode).find_stores
  end
end
