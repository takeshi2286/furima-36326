FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'aaa000'}
    password_confirmation {password}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_ruby            {'タナカ'}
    last_ruby             {'タロウ'}
    birth_date            {'19300101'}
  end
end