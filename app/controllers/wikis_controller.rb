class WikisController < ApplicationController

  def index
    if current_user.standard?
      @wikis = Wiki.where(private: false)
    else
      @wikis = Wiki.all
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

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
