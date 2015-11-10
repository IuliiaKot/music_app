class BandsController < ApplicationController
  before_action :require_user!
  before_action :get_user_id

  def index
    if params[:favorite]
      @bands_favorite = Band.where(:user_id => current_user.id, :favotite => true).all
    else
      @bands = Band.where(:user_id => current_user.id).all
    end
  end

  def new
    @album = Band.new
  end

  def create

    @band = current_user.bands.new(band_params)

    if @band.save
      redirect_to '/bands'
    else
      flash.now[:errors] = @band.errors.full_messages
      render 'new'
    end
  end

  def favorite

    favor = Band.where(:user_id => current_user.id).find(params[:id])[:favotite]

    if favor
      Band.where(:user_id => current_user.id).update(params[:id], :favotite => false)
      redirect_to '/bands'
    else
      Band.where(:user_id => current_user.id).update(params[:id], :favotite => true)
      redirect_to '/bands'
    end
    # Track.update(params[:id], :favorite => favor)
    # redirect_to '/tracks'
  end


  def destroy
    @band = Band.where(:user_id => get_user_id).find(params[:id])
    @band.destroy
    redirect_to '/bands'
  end


  private
    def band_params
      params_album = params.require(:band).permit(:name)
    end

    def album_params
      params_album = params.require(:band).permit(:name_album, :year)
    end


end
