class GistsController < ApplicationController

  def index
    @gists = Gist.where(user_id: current_user.try(:id))
  end

  def show
    @gist = Gist.find(params[:id])
    @comment = Comment.new(gist_id: @gist.id)
  end

  def new
    @gist = Gist.new
    @gist.contents.build
  end

  def edit
    @gist = Gist.find(params[:id])
  end

  def create
    @gist = Gist.new(gist_params)
    @gist.user_id = current_user.try(:id)
    if @gist.save
      redirect_to @gist
    else
      render :new
    end
  end

  def update
    @gist = Gist.find(params[:id])
    @gist.update_attributes(gist_params)
    render :show
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    redirect_to gists_path
  end

  private

  def gist_params
    params.require(:gist).permit(:description, 
      contents_attributes: [:id, :name, :value, :_destroy],
      comments_attributes: [:id, :body, :_destroy]
    )
  end

end
