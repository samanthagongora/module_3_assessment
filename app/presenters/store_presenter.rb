class StorePresenter
  def initialize(zipcode)
    @zipcode = zipcode
    @store_data = Store.find(zipcode)
  end
end
