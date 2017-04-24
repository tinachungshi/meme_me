class MemesController < ApplicationController

  def index
    @memes = Meme.all
  end

  def new
    # Provide the model instance to the form_for helper
    @meme = Meme.new
  end

  def create
  end

private

  # Implement Strong Params
  def meme_params
    params.require(:meme).permit(:title, :category, :image)
  end


end
