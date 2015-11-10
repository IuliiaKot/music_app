# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  
  Band.create(name: "Moby", user_id: User.first[:id])
  Band.create(name: "Sting", user_id: User.first[:id] )
  Band.create(name: "Tom Waits", user_id: User.first[:id])

  band1 = Band.first
  band1.albums.create(name: "Innocents", year: 2013, user_id: User.first[:id] )
  band1.albums.create(name: "Wait for me", year: 2009, user_id: User.first[:id] )
  band2 = Band.second
  band2.albums.create(name: "The Last Ship", year: 2013, user_id: User.first[:id] )


  band3 = Band.third
  band3.albums.create(name: "Blue Valentine", year: 2015, user_id: User.first[:id] )
  band3.albums.create(name: "Bad As Me", year: 2011, user_id: User.first[:id] )

  album1 = Album.first
  Track.create(name: "Everything That Rises",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "Going Wrong",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "Almost Home",  album_id: album1.id,user_id: User.first[:id] )
  Track.create(name: "A Case fro Shame",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "The Perfect Life",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "A Long Time",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "Saints",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "Tell Me",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "The Lonely Night",  album_id: album1.id, user_id: User.first[:id] )
  Track.create(name: "The Dogs",  album_id: album1.id, user_id: User.first[:id] )



  album2 = Album.second
  album2.tracks.create(name: "Division", user_id: User.first[:id] )
  album2.tracks.create(name: "Pale Horses", user_id: User.first[:id] )
  album2.tracks.create(name: "Study War", user_id: User.first[:id] )
  album2.tracks.create(name: "Walk With Me", user_id: User.first[:id] )
  album2.tracks.create(name: "Stock Radio", user_id: User.first[:id] )
  album2.tracks.create(name: "Mistake", user_id: User.first[:id] )
  album2.tracks.create(name: "Hope is Gone", user_id: User.first[:id] )
  album2.tracks.create(name: "Isolate", user_id: User.first[:id] )
  album2.tracks.create(name: "TGhost Return", user_id: User.first[:id] )
