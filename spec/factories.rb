FactoryGirl.define do
  factory :user do
    name     "Enrique Figueroa"
    email    "efigueroa@siphon.com"
    password "foobar"
    password_confirmation "foobar"
  end
end