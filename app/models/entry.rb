class Entry < ApplicationRecord
  belongs_to :room
  belongs_to :user
 
  scope :least_entries, ->(date) { where("reserved_date BETWEEN ? AND ?",date.to_date - 7.days,date.to_date + 7.days ) }

  validates :user_id,:reserved_date,:usage_time,:people,:room_id,presence: true
  # validates :user_id,uniqueness: true

end
