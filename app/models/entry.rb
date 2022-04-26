class Entry < ApplicationRecord
  belongs_to :room
  # TODO: 予約エントリのuser_idだけでユーザーの情報とひも付けて、予約エントリのユーザー名やメールアドレスを持たなくても良いよう変更

  scope :least_entries, ->(date) { where("reserved_date BETWEEN ? AND ?",date.to_date - 7.days,date.to_date + 7.days ) }

  validates :user_name,:user_email,:reserved_date,:usage_time,:people,:room_id,presence: true
  validates :user_email,uniqueness: true

end
