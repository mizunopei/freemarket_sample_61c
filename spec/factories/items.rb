FactoryBot.define do
  factory :item do
    name            {"パーカー"}
    introduction    {"非常に着心地が良くおすすめです！"}
    condition       {"未使用に近い"}
    d_burden        {"送料込み(出品者負担)"}
    d_way           {"未定"}
    prefecture_id   {"1"}
    d_date          {"1"}
    price           {"2500"}
  end
end