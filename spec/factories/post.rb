FactoryBot.define do
  factory :post do
    title {"a"}
    body {"aa"}
    impression {"aaa"}
    association :user 
  end    
end
