class Friendship < ActiveRecord::Base
    belongs_to :friender, :class_name => "Account"
    belongs_to :friend, :class_name => "Account"
end
