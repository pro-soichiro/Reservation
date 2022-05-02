class User < ApplicationRecord
  before_save :chenge_password

  has_many :entries, dependent: :destroy

  validates :name, :email, :password, presence: :true
  validates :email, uniqueness: true

  private

    def chenge_password
      self.password = BCrypt::Password.create(self.password)
    end

end
