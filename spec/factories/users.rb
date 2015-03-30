FactoryGirl.define do
  factory :user do
    email { generate(:email) }
    password 'testpassword'
    password_confirmation { |u| u.password }
    confirmed_at Time.now
  end
end