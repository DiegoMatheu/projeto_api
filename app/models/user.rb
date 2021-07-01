
class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :password, presence: true, length: {minimum: 6}
    VALID_PASSWORD_FORMAT= /(?=.*\p{Ll})(?=.*\d)/x
    validates :password, format:{with: VALID_PASSWORD_FORMAT}
    validates :cpf, cpf: true
     
    validates :cpf, presence:true, uniqueness: true
    VALID_EMAIL_FORMAT=  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    validates :email, presence: true, length: {maximum: 260}, format: {with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
    before_save {self.email = email.downcase}

    

end
