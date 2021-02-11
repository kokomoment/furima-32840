
## usersテーブル

 Column             | Type    | Options     |
 ------------------ | ------- | ----------- |
 nickname           | string  | null: false |
 email              | string  | null: false |
 encrypted_password | string  | null: false |
 first_name         | string  | null: false |
 last_name          | string  | null: false |
 first_name_kana    | string  | null: false |
 last_name_kana     | string  | null: false |
 birthday_year_id   | integer |             |
 birthday_month_id  | integer |             |
 birthday_day_id    | integer |             |

## Association

- has_many :items
- has_many :orders
- has_many :addresses

## itemsテーブル

 Column             | Type       | Options
 ------------------ | ---------- | ----------- |
 product            | string     | null: false |
 explain            | text       | null: false |
 category_id        | integer    | null: false |
 state_id           | integer    | null: false |
 ship_fee_id        | integer    | null: false |
 ship_prefecture_id | integer    | null: false |
 ship_date_id       | integer    | null: false |
 price              | integer    | null: false |
 user               | references |             |

## Association

- belongs_to :user
- has_one :order
- has_one :address

## ordersテーブル

 Column       | Type       | Option |
 ------------ | ---------- | ------ |
 user         | references |        |
 item         | references |        |
 address      | references |        |

## Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

  Column       | Type       | Options     |
 ------------- | ---------- | ----------- |
 postcode      | string     | null: false |
 prefecture_id | integer    | null: false |
 city          | string     | null: false |
 block         | string     | null: false |
 building      | string     |             |
 phone_number  | string     | null: false |
 user          | references |             |
 item          | references |             |

## Association

- belongs_to :user
- belongs_to :item
- belongs_to :order