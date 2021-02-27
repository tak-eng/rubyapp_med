class IdeasController < ApplicationController
  def index
    @idea = Idea.includes(:tags).all.order('created_at DESC')
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)

    # if @post.save
    #   flash[:notice] = "投稿が保存できました"
    #   redirect_to root_path
    # else    
    #   @post = Post.new
    #   flash.now[:alert] = "投稿できません、もう一度入力してください"
    #   render :new
    # end
  end

  private
  def idea_params
    params.require(:idea).permit(:body, :tag_list)
  end
end
