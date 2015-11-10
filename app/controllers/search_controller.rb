class SearchController < ApplicationController
  before_action :require_user!
  before_action :get_user_id

  def index

    if (params[:search])
      band = Band.where(:user_id => current_user.id).search(params[:search])
      @bands = band.albums if band
      @album = Album.where(:user_id => current_user.id).search(params[:search])
      @tracks_for_album = @album.tracks if @album
      @tracks = Track.where(:user_id => current_user.id).search(params[:search])
    end
  end



end
