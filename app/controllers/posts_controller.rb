class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :show]

  # GET /posts.json
  def index
 #   @posts = Post.order('created_at DESC')
     @posts = Post.limit(4).order('created_at DESC')
     @posts2 = Post.limit(4).offset(4).order('created_at DESC')
     @posts3 = Post.limit(4).offset(8).order('created_at DESC')
     @popular = Post.limit(4).order("RANDOM()")
     @enter = Post.where("category_id = ?", '3').limit(1).order('created_at DESC')
     @enter2 = Post.where("category_id = ?", '3').limit(2).offset(1).order('created_at DESC')

     @poli =  Post.where(category_id: [4, 5, 6, 7]).limit(1).order('created_at DESC')
     @poli2 =  Post.where(category_id: [4,5, 6, 7]).limit(2).offset(1).order('created_at DESC')

     

     @busi = Post.limit(2).order('created_at ASC')
     @busi2 = Post.limit(2).order('created_at ASC')


     @sci = Post.where("category_id = ?", '2').limit(1).order('created_at DESC')
     @sci2 = Post.where("category_id = ?", '2').limit(1).offset(1).order('created_at DESC')



     @bg2 = Post.limit(1).offset(1).order('created_at DESC')
     @bg3 = Post.limit(1).offset(2).order('created_at DESC')
     @bg4 = Post.limit(1).offset(3).order('created_at DESC')
     @bg5 = Post.limit(1).offset(4).order('created_at DESC')
     @bg6 = Post.limit(1).offset(5).order('created_at DESC')
     @bg7 = Post.limit(1).offset(6).order('created_at DESC')
     @bg8 = Post.limit(1).offset(7).order('created_at DESC')
     @bg9 = Post.limit(1).offset(8).order('created_at DESC')
     @bg10 = Post.limit(1).offset(9).order('created_at DESC')
     @bg11 = Post.limit(1).offset(10).order('created_at DESC')
     @bg12 = Post.limit(1).offset(11).order('created_at DESC')


     @last = Post.limit(1).order('created_at DESC')

     @latest = Post.limit(4).order('created_at DESC')
     @popular2 = Post.limit(4).order("RANDOM()")

     @footer = Post.limit(3).order('created_at DESC')
     @footer2 = Post.limit(3).order("RANDOM()")

    
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @sci = Post.limit(4).order('created_at ASC')
    @latest = Post.limit(6).order('created_at DESC')
    @popular2 = Post.limit(6).order("RANDOM()")
    @footer = Post.limit(3).order('created_at DESC')
    @footer2 = Post.limit(3).order("RANDOM()")

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

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

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
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

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry only admins can do that"
      end
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :image, :category_id)
    end

end
