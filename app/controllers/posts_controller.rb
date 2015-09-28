class PostsController < ApplicationController

    def create
        post = Post.new
        if post.slug == false || post.slug == ""
            post.slug = post.title.parameterize.first(50)
        end
    end

end