class Page < ActiveRecord::Base

    # Validations
    # -----------

    validates :heading, presence: {message: "The webpage heading cannot be blank."}
    validates :slug, uniqueness: {message: "The slug must be unique"}
    validate :no_backup_slug

    def no_backup_slug
        puts "running"
        if self.slug.nothing? && self.heading.nothing?
            self.errors[:slug] << 'The slug and page heading cannot both be blank'
        elsif self.slug.nothing? && !self.heading.nothing?
            self.slug = self.heading
        end
    end

    # Relations
    # ---------

    has_one :post
    has_one :tag
    has_many :code_files
end

# title, content, hero_image