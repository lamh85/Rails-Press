class Page < ActiveRecord::Base

    # Validations
    # -----------

    validates :heading, presence: {message: "The webpage heading cannot be blank."}
    validates :slug, uniqueness: {message: "The slug must be unique"}
    validates :title, presence: {message: "Title cannot be blank"}

    def validate(record)
        if record.slug.nothing? && record.header.nothing?
            record.errors[:slug] << 'The slug and page header cannot both be blank'
        elsif record.slug.nothing? && !record.header.nothing?
            record.slug = record.header
        end
    end

    # Relations
    # ---------

    has_one :post
    has_one :tag
    has_many :code_files
end