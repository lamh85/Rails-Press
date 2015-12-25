class Object
    def nothing?
        return true if self == nil || self.strip.length == 0
        return false
    end

    def invalid_slugs
        db_tables   = ActiveRecord::Base.connection.tables.map { |element| element.to_s }
        controllers = Dir[Rails.root.join('app/controllers/*_controller.rb')].map { |path| (path.match(/(\w+)_controller.rb/); $1) }
        (db_tables + controllers).uniq
    end
end