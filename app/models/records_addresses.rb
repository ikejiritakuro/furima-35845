class RecordsAddresses
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality
    validates :address
    validates :token
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "をハイフン(-)を入れて入力してください"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "半角数字で入力してください"}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "は1以外の値にしてください"}

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number,record_id: record.id)
  end
end