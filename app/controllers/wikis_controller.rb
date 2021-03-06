class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Your entry was saved."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was a problem saving your entry. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all
    @get_wikis = Collaborator.where(wiki_id: @wiki.id)
    @collaborators = User.where(id: @get_wikis.pluck(:user_id))
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Your entry was updated."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving your entry. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash[:alert] = "There was an error deleting your entry."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :quote, :body, :sources, :private)
  end
end
