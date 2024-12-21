module EzJwt
  class User < ApplicationRecord
    has_secure_password

    before_save {email.downcase!}

    validates :email, presence:true, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX}, 
    uniqueness: {case_sensitive: false, message: :inuse}

    validates :password, presence: true, format: {with: VALID_PWD_REGEX, message: :badpwd}, on: :create
    validates :password, presence: true, format: {with: VALID_PWD_REGEX, message: :badpwd}, on: :update, if: :password_digest_changed?

  end
  
end
