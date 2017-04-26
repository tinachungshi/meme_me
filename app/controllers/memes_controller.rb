class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:index, :show]

  def index
    @categories = Category.all
  end

  # def show
  #   @meme = Meme.find(params[:id])
  # end

  def new
    @meme = Meme.new
    @categories = Category.all
  end

  def create
    @meme = Meme.new(meme_params)
    if @meme.save
      @meme.user = current_user
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

  def all
    @memes = Meme.all
  end

  def filtered
    @memes = Meme.where(category: params[:cat])
  end

  def random
    @memes = Meme.all
    @number = @memes.length
    @random_no = rand(@number) + 1
    @show_image = Meme.find(@random_no)
  end


private

  def meme_params
    params.require(:meme).permit(:title, :category, :image)
  end


end
