class Post < ActiveRecord::Base

    has_many :comments
    belongs_to :user
    attr_accessor :title
    attr_accessor :slug

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
end