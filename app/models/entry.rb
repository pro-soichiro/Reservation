class Entry < ApplicationRecord
  scope :least_entries, ->(date) { where("reserved_date BETWEEN ? AND ?",date.to_date - 7.days,date.to_date + 7.days ) }
end
