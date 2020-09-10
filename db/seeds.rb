Recording.destroy_all
Review.destroy_all
User.destroy_all
Artist.destroy_all
Song.destroy_all

Artist.create(name: "Beach Boys")
Artist.create(name: "City Girls")

Song.create(name: "Kokomo", lyric: "Aruba, Jamaica, ooh I want to take ya")
Song.create(name: "Summer", lyric:"Summer is over")

Recording.create(link: "https://song.link/us/i/728255310", artist_id: Artist.ids.sample, song_id: Song.ids.sample)
Recording.create(link: "https://song.link/us/i/158860501", artist_id: Artist.ids.sample, song_id: Song.ids.sample)

User.create(first_name: "Austin", last_name: "Oie", username: "HereComePretzel", email: "austinoie@gmail.com", password_digest: "nil", age: 600, country: "nil", img_url: "nil")

Review.create(rating: 1, user_id: User.ids.sample, recording_id: Recording.ids.sample, description: "The Beach Boys are a revelation.")


