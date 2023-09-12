class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "スケジュールを登録しました"
      redirect_to :posts
    else
      flash.now[:failure] = "スケジュールの登録に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = "スケジュールを更新しました"
      redirect_to :posts
    else
      flash.now[:failure] = "スケジュールの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = "スケジュールを削除しました"
    else
      flash[:failure] = "スケジュールの削除に失敗しました"
    end

    redirect_to :posts
  end

  private

  def post_params
    params.require(:post).permit(:title, :start_at, :end_at, :is_all_day, :memo)
  end
end