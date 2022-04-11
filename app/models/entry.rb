class Entry < ApplicationRecord
  belongs_to :room

  scope :least_entries, ->(date) { where("reserved_date BETWEEN ? AND ?",date.to_date - 7.days,date.to_date + 7.days ) }
end
