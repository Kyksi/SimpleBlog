class PostsController <ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'The article created successfully'
      redirect_to @post
    else
      flash[:danger] = 'The article is not created'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = 'The article updated successfully'
      redirect_to @post
    else
      flash[:danger] = 'The article is not updated'
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'The article deleted successfully'
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
