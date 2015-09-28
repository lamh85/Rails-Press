class Post < ActiveRecord::Base

    has_many :comments
    belongs_to :user
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