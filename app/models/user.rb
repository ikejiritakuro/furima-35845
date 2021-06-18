class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
  validates :first_name  
  validates :last_name
end
        

  validates :nickname, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true  
end
