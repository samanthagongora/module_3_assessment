FactoryGirl.define do
  factory :item do |i|
    name "#{i} name"
    description "#{i} description"
    image_url "#{i} image_url"
  end
end
