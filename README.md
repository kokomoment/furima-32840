
## usersテーブル

 Column          | Type    | Options
 --------------- | ------- | ------------------------------------------------------------
 nickname        | string  | null: false
 email           | string  | null: false
 password        | string  | null: false, format: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
 first_name      | string  | null: false, format: /\A[ぁ-んァ-ヶ一-龥々]+\z/
 last_name       | string  | null: false, format: /\A[ぁ-んァ-ヶ一-龥々]+\z/
 first_name_kana | string  | null: false, format: /\A[ァ-ヶ]+\z/
 last_name_kana  | string  | null: false, format: /\A[ァ-ヶ]+\z/
 birthday_year   | integer | null: false
 birthday_month  | integer | null: false
 birthday_day    | integer | null: false

## Association

- has_many :items
- has_many :orders

## itemsテーブル

 Column          | Type       | Options
 --------------- | ---------- | ----------------------------------------------------
 image           |            |
 product         | string     | null: false, length: { maximum 40 }
 explain         | text       | null: false, length: { maximum 1000 }
 category        | string     | null: false
 state           | string     | null: false
 ship_fee        | string     | null: false
 ship_prefecture | string     | null: false
 ship_date       | string     | null: false
 price           | integer    | null: false, format: /\A[3-9]/, length: { in: 3..7 }
 user_id         | references |

## Association

- belongs_to :user
- has_many :orders

## ordersテーブル

 Column       | Type       | Options
 ------------ | ---------- | -----------------------------------------
 card_number  | string     | null: false
 card_month   | integer    | null: false
 card_year    | integer    | null: false
 card_cvc     | string     | null: false
 postcode     | string     | null: false, format: /\A\d{3}[-]\d{4}\z/
 prefecture   | string     | null: false
 city         | string     | null: false
 block        | string     | null: false
 building     | string     | null: false
 phone_number | string     | null: false, format: /\d{11}/
 user_id      | references |
 item_id      | references |

 ## Association

 - belongs_to :user
 - belongs_to :item