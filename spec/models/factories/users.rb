FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {'000000'}
    last_name             {'test'}
    first_name            {'test'}
    last_name_katakana     {'テスト'}
    first_name_katakana    {'テスト'}
    birthday               {'2000-01-01'}
  end
end