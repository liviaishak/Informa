class CollaborationsController < ApplicationController
  def new
    @collaboration = Collaboration.new
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:search])
    if @user
      @collaboration = Collaboration.new(wiki: @wiki, user: @user)
      if @collaboration.save
        flash[:notice] = "Collaboration was saved."
        redirect_to edit_wiki_path(@wiki)
      else
        flash.now[:alert] = "There was an error saving the collaboration. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])
    @collaboration_user = User.find(@collaboration.user_id)

      if @collaboration.destroy
        flash[:notice] = "#{@collaboration_user.email} was removed as a collaborator."
        redirect_to edit_wiki_path(@wiki)
      else
        flash.now[:alert] = "There was an error removing this collaboration."
        redirect_to edit_wiki_path(@wiki)
      end
   end
end
