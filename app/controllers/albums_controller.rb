class AlbumsController < ApplicationController
  before_action :require_user!
  before_action :get_user_id

  def index
    
    if params[:favorite]
      @albums_favorite = Album.where(:user_id => current_user.id, :favotite => true).all
    else
      @albums = Album.where(:user_id => current_user.id).all
    end
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
  end

  def new
    @album = Album.new
    @bands = Band.where(:user_id => current_user.id)
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      redirect_to '/albums'
    else
      flash.now[:errors] = @album.errors.full_messages
      render 'albums/new'
    end
  end

  def destroy
    @album = Album.where(:user_id => get_user_id).find(params[:id])
    @album.destroy
    redirect_to '/albums'
  end


  def favorite
    favor = Album.where(:user_id => current_user.id).find(params[:id])[:favotite]

    if favor
      Album.where(:user_id => current_user.id).update(params[:id], :favotite => false)
      redirect_to '/albums'
      #redirect_to :back, notice: "Add to favorite"
    else
      Album.where(:user_id => current_user.id).update(params[:id], :favotite => true)
      redirect_to '/albums'
      #redirect_to :back, notice: "Remove from favorite"
    end
  end


  private
  def album_params
    params_album = params.require(:@album).permit(:name, :year)
    params_album[:band_id] = params[:id]
    params_album
  end


end
