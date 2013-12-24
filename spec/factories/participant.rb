FactoryGirl.define do
  factory :participant do
    sequence(:name) {|x| "Name#{x}"}
    sequence(:email) {|x| "test#{x}@test.com"}
    santa
  end
end
