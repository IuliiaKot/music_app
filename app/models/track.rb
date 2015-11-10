class Track < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  #has_one :band, throught: :album, source: :band
  validates :name, uniqueness: {scope: :album_id }
  validates :name, presence: true,  uniqueness: true


  def self.search(query)
    Track.find_by(name: query)
  end
end
