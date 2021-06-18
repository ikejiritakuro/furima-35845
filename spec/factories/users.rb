FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    encrypted_password {password}
    first_name {'山田'}
    last_name {'太郎'}
    first_name_kana {'ヤマダ'}
    last_name_kana {'タロウ'}
    birth_date {'生年月日'}
  end
end