class User < ApplicationRecord
    has_many :microposts # add this line to your file
    before_save { email.downcase! }
    validates :name,  presence: true, length: { maximum: 50, minimum: 1 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
