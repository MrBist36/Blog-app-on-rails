class ArticlesController < ApplicationController
  def index
    if current_user && current_user.organization
      if params[:all_articles]
        @articles = current_user.organization.articles
      else
        @articles = current_user.articles
      end
    else
      logger.debug "Current user or organization is nil" 
      redirect_to new_user_session_path, alert: 'You need to sign in to access this page.'
    end
  end

  def fetch_org_articles
    org = Organization.find_by(id:(Membership.all.find_by(user_id:current_user.id).organization_id))
    @articles_org = org.articles
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
    @article = @organization.users.find_by(id: current_user.id).articles.build
  end

  def create
    @organization_id = Membership.find_by(user_id: current_user.id).organization_id
    @organization = Organization.find_by(id: @organization_id)
    @article = @organization.users.find_by(id: current_user.id).articles.build(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    unless current_user[:id]== @article[:user_id]
      return
    end
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :organization_id,:user_id)
    end
end
