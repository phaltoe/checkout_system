FactoryBot.define do
  factory :product do
    code { Faker::IDNumber }
    name  { Faker::Name }
    price { 30}

    initialize_with { new(code, name, price) }
  end
end