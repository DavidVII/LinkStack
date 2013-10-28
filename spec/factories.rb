FactoryGirl.define do
  factory :user do
    username 'TestUser'
    email 'example@email.com'
    password 'foobar1'
    password_confirmation 'foobar1'
  end
end
