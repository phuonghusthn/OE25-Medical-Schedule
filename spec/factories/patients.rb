FactoryBot.define do
  factory :patient do |f|
    f.user_name {Faker::Name.name}
    f.full_name {Faker::Name.name}
    f.email {Faker::Internet.email}
    f.password {"111111"}
    f.password_confirmation {"111111"}
    f.activated {true}
    f.activated_at {Time.zone.now}
  end
end
