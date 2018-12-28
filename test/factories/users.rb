FactoryBot.define do
  factory :user do
    password { '123456' }

    factory :cosmonaut do
      role { User.roles[:cosmonaut] }
      email { "cosmonaut@mail.bro" }
    end

  end
end
