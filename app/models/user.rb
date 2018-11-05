class User < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50, minimum: 1 }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
