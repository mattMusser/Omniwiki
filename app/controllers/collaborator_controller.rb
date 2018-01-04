class CollaboratorController < ApplicationController
  before_action :get_current_wiki

  def index
    @user = User.all
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki_id, user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator add."
    else
      flash[:alert] = "Error occured. Please try again."
    end

    redirect_to :back
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed"
    els
    end
  end

  private

  def get_current_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
