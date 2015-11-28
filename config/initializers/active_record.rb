module ActiveRecord
    class Base
        def self.attrs_array
            self.new.attributes.keys.map { |element| element.to_sym  }
        end
    end
end