class PostsController < ApplicationController

    # TABLE OF CONTENTS:
    # Create, Read, Update, Destroy, Private

    def new
        @post = Post.new
        render "new"
    end

    def create
        byebug
        post = Post.new(post_params)
        if (post.slug && post.slug.strip == (false || "" || nil)) || !post.slug
            post.slug = post.title.parameterize.first(50)
        end
        if post.save
        end
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit(*Post.attrs_array)
    end

end