# Pseudo(?)-model for collecting/filling in data in the topping preferences form.

class PreferencesForm
    include ActiveModel::Model  # a.k.a. ActiveMallard (walks, talks, and quacks like an ActiveRecord)
    
    def initialize(attributes={})
        super
        
        # add topping-based field names as instance variables to the PreferencesForm so I can serve it all up in a web form (like a boss)
        PreferencesForm.field_names.each do |var_name|
            instance_variable_set("@#{var_name}", :unlisted_toppings)
            
            # add accessors:
            eigenclass = class<<self; self; end # Magic from the internets, I have no idea what's going on here O_o
            eigenclass.class_eval do
                attr_accessor var_name
            end
        end
    end
    
    def self.field_names
        arr = []
        
        # loop through all toppings known to man and beast and postgres (mostly postgres)
        # and make 'topping'+(id) field names for each of them
        Topping.all.each do |topping|
            arr << "topping#{topping.id}"
        end
        
        return arr
    end
    
    def populate_from(person)
        person.needed_toppings.each do |topping|
            field_name = "@topping#{topping.id}".to_sym
            instance_variable_set(field_name, :needed_toppings)
        end
        
        person.wanted_toppings.each do |topping|
            field_name = "@topping#{topping.id}".to_sym
            instance_variable_set(field_name, :wanted_toppings)
        end
        
        person.mehed_toppings.each do |topping|
            field_name = "@topping#{topping.id}".to_sym
            instance_variable_set(field_name, :mehed_toppings)
        end
        
        person.hated_toppings.each do |topping|
            field_name = "@topping#{topping.id}".to_sym
            instance_variable_set(field_name, :hated_toppings)
        end
        
    end
    
end
