class PreferencesForm
    include ActiveModel::Model  # a.k.a. ActiveMallard (walks, talks, and quacks like an ActiveRecord)
    
    def initialize(attributes={})
        super
        
        # loop through all toppings known to man and beast and postgres (mostly postgres)
        # and add 'topping'+(id) as instance variables to the PreferencesForm so I can serve it all up in a web form (like a boss)
        Topping.order(:category, :name).each do |topping|
            varname = "topping#{topping.id}"
            instance_variable_set("@#{varname}", :unlisted_toppings)
            # instance_variable_set("@#{varname}", :unlisted_toppings)
            
            # add accessors:
            eigenclass = class<<self; self; end # Kyle: Magic from the internets, I have no idea what's going on here O_o
            eigenclass.class_eval do
                attr_accessor varname
            end
        end
        
        # if person
            
        # end
    end
    
    def populate_from(person)
        # ...
    end
    
end
