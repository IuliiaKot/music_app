class TracksController < ApplicationController
  before_action :require_user!
  before_action :get_user_id

  def index
    if params[:favorite]
      @tracks_favorite = Track.where(:user_id => current_user.id, :favotite => true).all
    else
      @tracks = Track.where(:user_id => current_user.id).all
    end
  end



  def new
    @track = Track.new
  end

  def create
  #  track = Track.new(track_params)
    @track = current_user.tracks.new(track_params)
    if @track.save
      redirect_to '/tracks'
    else
      flash.now[:errors] = @track.errors.full_messages
      render 'new'
    end
  end

  def favorite

    favor = Track.where(:user_id => current_user.id).find(params[:id])[:favotite]
    if favor
      Track.where(:user_id => current_user.id).update(params[:id], :favotite => false)
      redirect_to :back
    else
      Track.where(:user_id => current_user.id).update(params[:id], :favotite => true)

      redirect_to  :back
    end

  end

  def destroy
    @track = Track.where(:user_id => get_user_id).find(params[:id])
    @track.destroy
    redirect_to '/tracks'
  end


  private

    def track_params
      params.require(:@track).permit(:name, :album_id)

    end

end
