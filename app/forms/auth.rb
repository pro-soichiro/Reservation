class Auth
  include ActiveModel::Model
  attr_accessor :email,:password


  # validates :email,:password, precense: true

end