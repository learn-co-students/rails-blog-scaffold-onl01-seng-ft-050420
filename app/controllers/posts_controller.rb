class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index 
        @posts = Post.all 
    end 

    def new 
        @post = Post.new 
    end 

    def create 
        @post = Post.create(params.require(:post).permit(:title, :description))
        redirect_to post_path(@post)
    end 

    def show 

    end 

    def edit 

    end 

    def update 
        @post.update(params.require(:post).permit(:title, :description))
        redirect_to post_path(@post)
    end 

    def destroy
        @post.destroy
        respond_to do |format|
          format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

    private 

    def set_post 
        @post = Post.find(params[:id])
    end 
end
