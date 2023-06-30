FactoryBot.define do
  factory :url do
    original_url { "MyString" }
    short_url { "MyString" }
    click_count { 1 }
  end
end
