class PostsController < ApplicationController
  before_action :set_post, except: [:index, :new, :create]

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@post), notice: '保存しました'
    else
      flash[:alert] = "問題が発生しました"
      render :new
    end
  end

  def show

  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to edit_post_path(@post), notice: '保存しました'
    else
      flash[:alert] = "問題が発生しました"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path, notice: '削除しました'
    else
      flash[:alert] = "問題が発生しました"
      render :post_path
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end