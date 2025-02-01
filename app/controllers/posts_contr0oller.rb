class PostsController < ApplicationController
    def index
        @posts = Post.all 
    end

    def show
    end

    def new
        @post = Post.new 
    end

    def create
        @post = Post.new(allowed_post_params)
        if @post.save
            flash[:success] = "Great! Your post has been created!"
            redirect_to post_path(@post.id)
        else
            flash.now[:error] = "Rats! fix your mistakes."
            render :new, status: :unprocessable_entity 
        end 
    end

    def update
    end

    def destroy
    end

    private 
    def allowed_post_params
        params.require(:post).permit(:title, :body, :author_id)
    end
end