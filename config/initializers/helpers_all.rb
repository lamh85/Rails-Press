class Object
    def nothing?
        return true if self == nil || self.strip.length == 0
        return false
    end

    def db_tables
        ActiveRecord::Base.connection.tables.map { |element| element.to_s }
    end
end