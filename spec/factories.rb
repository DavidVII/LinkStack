FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Person_#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password 'foobar1'
    password_confirmation 'foobar1'
  end

  factory :stack do
    name 'ExampleStack'
    description 'Example Stack Description'
    user
  end

  factory :link do
    url 'http://davidbecerra.com'
    description 'Example Link Description'
    association :user
    association :stack
  end
end
