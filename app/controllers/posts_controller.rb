class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    #@user = current_user
    @post = Post.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end
  # GET /posts/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id] }
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.category_id = params[:category_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    #vote = @post.votes + 1
    #@post.update_attribute(:votes=> vote)
    logger.info "voted"
    redirect_to(posts_path)
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @product.category_id = params[:category_id]

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:category, :title, :content, :pics, :link, :address, :lat, :long, :user_id)
    end
end
