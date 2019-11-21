FactoryBot.define do
  factory :user do
    nickname              {"mercali"}
    email                 {"mercali@gmail.com"} 
    password              {"1q2w3e4"}
    password_confirmation {"1q2w3e4"}
    last_name             {"神南坂"}
    first_name            {"一郎"}
    last_name_kana        {"ジンナンザカ"}
    first_name_kana       {"イチロウ"}
    birth_day             {"2019-12-01"}
    tel                   {"09012345678"}
  end
end