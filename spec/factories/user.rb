FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "ddmdb#{n}@spilth.org" }
    sequence(:username) {|n| "ddmdb#{n}" }

    after(:build) do |u|
      u.password_confirmation = u.password = 'password'
      u.confirmed_at = Time.now
    end

    factory :admin_user do
      admin true
    end
  end
end
