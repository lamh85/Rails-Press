class Post < ActiveRecord::Base

    # Relations
    has_many :comments
    belongs_to :user

    # Validations
    validates :title, presence: {message: "Title cannot be blank"}
    validates :content, presence: {message: "Content cannot be blank"}
    validates :slug, uniqueness: {message: "The slug must be unique"}

    # Callbacks
    after_save :auto_create_slug

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

    # Automatically create a slug if blank
    def auto_create_slug
        if self.slug == nil || self.slug.gsub(" ","") == ""
            self.slug = self.title.parameterize.first(50)
            self.save
        end
    end
end