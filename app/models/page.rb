class Page < ActiveRecord::Base

    # Validations
    # -----------

    validates :heading, presence: {message: "The webpage heading cannot be blank."}
    validates :slug, uniqueness: {message: "The slug must be unique"}
    validate :no_backup_slug, :reserved_slug

    def no_backup_slug
        self.errors[:slug] << 'The slug and page heading cannot both be blank' if self.slug.nothing? && self.heading.nothing?
        self.slug = self.heading if self.slug.nothing? && !self.heading.nothing?
    end

    def compare_reserved_slug(slug_value)
        invalid_slugs.each { |table_name|
            if table_name == slug_value
                self.errors[:slug] << "The slug \"#{slug_value}\" is not allowed" 
                break
            end
        }
    end

    def reserved_slug
        compare_reserved_slug(self.slug)    if !self.slug.nothing?
        compare_reserved_slug(self.heading) if self.slug.nothing? && !self.heading.nothing?
    end

    # Relations
    # ---------

    has_one :post
    has_one :tag
    has_many :code_files
    has_many :visits
end