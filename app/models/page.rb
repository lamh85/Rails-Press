class Page < ActiveRecord::Base

    # Validations
    # -----------

    validates :heading, presence: {message: "The webpage heading cannot be blank."}
    validates :slug, uniqueness: {message: "The slug must be unique"}
    validate :no_backup_slug, :reserved_slug

    def no_backup_slug
        puts "running"
        if self.slug.nothing? && self.heading.nothing?
            self.errors[:slug] << 'The slug and page heading cannot both be blank'
        elsif self.slug.nothing? && !self.heading.nothing?
            self.slug = self.heading
        end
    end

    def compare_reserved_slug(slug_value)
        db_tables.each { |table_name|
            table_name == slug_value && self.errors[:slug] << "The slug \"#{slug_value}\" is not allowed"
        }
    end

    def reserved_slug
        !self.slug.nothing? && compare_reserved_slug(self.slug)
        self.slug.nothing? && !self.heading.nothing? && compare_reserved_slug(self.heading)
    end

    # Relations
    # ---------

    has_one :post
    has_one :tag
    has_many :code_files
    has_many :visits
end