FactoryGirl.define do
  factory :user do
    email { 'erickbogarin@email.com' }
    password "password"
    password_confirmation "password"
  end
end