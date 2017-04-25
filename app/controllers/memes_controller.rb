class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy]
  # Prevent anonymous users from
  # performing CUD on memes
  before_action :authorize, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def all
    @memes = Meme.all
  end

  def filtered
    @memes = Meme.where(category: params[:cat])
  end

  def show
    @memes = Meme.all
  end

  def new
    @meme = Meme.new
    @categories = Category.all
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.user = current_user
    if @meme.save
      redirect_to root_path
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
      redirect_to memes_path
    else
      render :edit
    end
  end

  def random
  end


private

  # Implement Strong Params
  def meme_params
    params.require(:meme).permit(:title, :category, :image)
  end


end
