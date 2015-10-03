class Page < ActiveRecord::Base

    # Relations
    belongs_to :user

    # Validations
    validates :title, presence: {message: "Title cannot be blank"}
    validates :content, presence: {message: "Content cannot be blank"}
    validates :slug, uniqueness: {message: "The slug must be unique"}

    # Callbacks
    before_validation :slug_format
    after_save :slug_blank

    def self.seed(number)
        number.times do |x|
            post = Post.new
            title = Faker::Lorem.paragraph(1)
            post.title = Faker::Lorem.paragraph(1)
            post.slug = post.title.parameterize.first(50)
            post.content = Faker::Lorem.paragraph(4)
            post.save
        end
    end

    def slug_format
        self.slug = self.slug.parameterize.first(50)
    end

    # Automatically create a slug if blank
    def slug_blank
        if self.slug == nil || self.slug.gsub(" ","") == ""
            self.slug = self.title.parameterize.first(50)
            self.save
        end
    end

    # If slug is not unique, then add a number
    def slug_duplicate
        if self.errors[:slug] != nil
            counter = 1
        end
    end

end