FactoryBot.define do
  factory :expedition do
    title { 'На Торманс' }

    transient { spaceships_amount { 5 } }

    after(:build) { |expedition, evaluator| create_list(:spaceship, evaluator.spaceships_amount, expedition: expedition) }
  end

end