class Account < ActiveRecord::Base
    has_secure_password
    
    validates :email,    uniqueness: { case_sensitive: false, message: "email address in use" },
                         format: { with: /@/, message: "not a valid email address", on: :create },
                         presence: true
    
    validates :password, presence: true, on: :create
    
    belongs_to :person
end
