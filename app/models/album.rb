class Album < ActiveRecord::Base
  belongs_to :band
  has_many :tracks
  belongs_to :user

  validates :name, uniqueness: {scope: :band_id}, presence: true
  # validates :band_id, presence: true,  uniqueness: true
  # validates :name, presence: true,  uniqueness: true


  def self.search(query)
    Album.find_by(name: query)
  end
end
