FactoryGirl.define do
  factory :user do
    email 'ddmdb.user@spilth.org'

    after(:build) do |u|
      u.password_confirmation = u.password = 'password'
      u.confirmed_at = Time.now
    end

    factory :admin_user do
      admin true
    end
  end
end
