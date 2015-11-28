class PostsController < ApplicationController

    # TABLE OF CONTENTS:
    # Create, Read, Update, Destroy, Private

    def new
    end

    def create
        post = Post.new
        if post.slug == false || post.slug == ""
            post.slug = post.title.parameterize.first(50)
        end
    end

    def update
    end

    def destroy
    end

    private

    def post_params
        params.require(:post).permit()
    end

end