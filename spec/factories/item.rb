FactoryGirl.define do
  factory :item do
    sequence :name do |i|
      "#{i} name"
    end
    sequence :description do |i|
      "#{i} description"
    end
    sequence :image_url do |i|
      "#{i} image_url"
    end
  end
end
