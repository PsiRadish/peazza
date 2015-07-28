class Topping < ActiveRecord::Base
    has_and_belongs_to_many :needers, :class_name => "Person"
    has_and_belongs_to_many :wanters, :class_name => "Person"
    has_and_belongs_to_many :mehers, :class_name => "Person"
    has_and_belongs_to_many :haters, :class_name => "Person"
end
