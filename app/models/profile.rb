class Profile < ApplicationRecord
    before_save {self.username = username.downcase}
    
    validates :username, presence: true, uniqueness: true
    has_many :messages
    has_secure_password
end
