FactoryGirl.define do
  factory :santa do
    name 'The best santa ever'
    rules 'Spend money, or dont'
    state 'editable'
    user

    factory :santa_with_participants do
      after(:create) do |santa|
          create_list(:participant, 5, santa: santa)
        end
      end
    end
  end
