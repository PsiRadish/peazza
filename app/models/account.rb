class Account < ActiveRecord::Base
    has_secure_password
    
    validates :email,    uniqueness: { case_sensitive: false, message: "email address in use" },
                         format: { with: /@/, message: "not a valid email address", on: :create },
                         presence: true
    
    validates :password, presence: true, on: :create
    
    belongs_to :person
    
    has_many :friendships, :foreign_key => "friender_id"
    has_many :friends, :through => :friendships
    
    has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    has_many :frienders, :through => :inverse_friendships, :source => :friender
    
    has_many :events
end
