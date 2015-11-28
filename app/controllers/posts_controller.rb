class PostsController < ApplicationController

    # TABLE OF CONTENTS:
    # Create, Read, Update, Destroy, Private

    def new
        @post = Post.new
    end

    def create
        post = Post.new(post_params)
        if post.slug.strip == (false || "" || nil)
            post.slug = post.title.parameterize.first(50)
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