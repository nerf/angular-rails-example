class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  respond_to :json

  # GET /posts
  def index
    respond_with Post.all
  end

  # GET /posts/1
  def show
    respond_with @post
  end

  # POST /posts
  def create
    respond_with Post.create(post_params)
  end

  # PATCH/PUT /posts/1
  def update
    @post.update(post_params)
    
    respond_with @post
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_with @post 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
