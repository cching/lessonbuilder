FactoryGirl.define do
  factory :user do
    name     "Chris Ching"
    email    "cching@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end