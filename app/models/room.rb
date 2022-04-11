class Room < ApplicationRecord
  has_many :entries, dependent: :destroy

  before_validation :room_name_checker

  validates :name, :place, :number, presence: true
  validates :name, length: {maximum: 30}
  validates :place, inclusion: {in: ["東京","大阪","福岡","札幌","仙台","名古屋","金沢"]}
  validates :number, numericality: {greater_than_or_equal_to: 5}
  validates :number, numericality: {less_than_or_equal_to: 30}
  validates :name, format: { with: /.#\d{2}/ , message: "会議室名が正しくありません"}

  validate :five_number

  private

  def five_number
    unless self.number % 5 == 0
      errors.add(:number, "収容人数は5の倍数で指定してください")
    end
  end

  def room_name_checker
    self.name = self.name.strip.gsub( /\s+/ ,"_")
  end
end
