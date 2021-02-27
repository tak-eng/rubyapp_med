class CategoriesController < ApplicationController
  def index
    @category = Category.includes(:ideas).all.order('created_at DESC')
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)

    if @post.save
      flash[:notice] = "投稿が保存できました"
      redirect_to root_path
    else    
      @post = Post.new
      flash.now[:alert] = "投稿できません、もう一度入力してください"
      render :new
    end
  end

  private
  def post_params
    params.require(:category).permit(:name, :tag_list)
  end

end


end
