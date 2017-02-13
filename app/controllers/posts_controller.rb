class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :post_owner]
  before_action :authenticate_user!,except:[:index]
      before_action :post_owner, only: [:edit, :update, :destroy]

  def post_owner
      unless @post.user_id == current_user.id
       flash[:notice] = 'Access denied as you are not owner of this Post!!!'
       redirect_to posts_path
      end
  end

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
    @post = current_user.posts.build
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
    @post = current_user.posts.build(post_params)
    #@post = Post.new(post_params)
    #@post.category_ids = [post_params[:category_id]]

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
    @post = Post.find(params[:post][:id])
    @post.upvote_by current_user
    #vote = @post.votes + 1
    #@post.update_attribute(:votes=> vote)
    logger.info "voted"
    redirect_to(posts_path)
  end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post.category_ids = params[:category_ids]

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
      params.require(:post).permit(:title, :votes, :content, :pics, :link, :address, :lat, :long, :user_id, :category_ids => [])
    end
end
