class MemesController < ApplicationController
  before_action :authorize, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
    @categories = Category.all
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render :new
    end
  end

  def edit
    @meme = Meme.find(params[:id])
  end

  def update
    @meme = Meme.find(params[:id])
    if @meme.update_attributes(meme_params)
      redirect_to meme_path
    else
      render :edit
    end
  end

  def destroy
    @meme = Meme.find(params[:id])
    @meme.destroy
    redirect_to root_path
  end

  def all
    @memes = Meme.all
  end

  def filtered
    @memes = Meme.where(category: params[:cat])
  end

  def random
    @memes = Meme.all
    @show_image = @memes.sample
  end


private

  def meme_params
    params.require(:meme).permit(:title, :category, :image, :user_id)
  end


end
