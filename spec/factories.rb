FactoryGirl.define do
  factory :medicine do
    name 'Calpol'
    category 'Syrup'
    sale_price 500
    quantity 50
  end
  factory :invalid_medicine, parent: :medicine do |f|
    f.name nil
  end
end

