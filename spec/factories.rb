FactoryGirl.define do

  factory :unconfirmed_user, class: User do
    email { Faker::Internet.email }

    password              'password'
    password_confirmation 'password'

    username { Faker::Internet.user_name }

    factory :user do
      after(:create) { |user, proxy| user.confirm! }

      factory :admin do
        after(:create) { |user| user.update_attribute :admin, true }
      end
    end

  end

end
