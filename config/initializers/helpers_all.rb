class Object
    def nothing?
        return true if self == nil || self.strip.length == 0
        return false
    end
end