Recording.destroy_all
Review.destroy_all
User.destroy_all
Artist.destroy_all
Song.destroy_all

Artist.create(name: "Beach Boys")

Song.create(name: "Kokomo", lyric: "Aruba, Jamaica, ooh I want to take ya")

Recording.create(link: "https://song.link/us/i/728255310", artist_id: 1, song_id: 1)

User.create(first_name: "Austin", last_name: "Oie", username: "HereComePretzel", email: "austinoie@gmail.com", password_digest: "nil", age: 600, country: "nil", img_url: "nil")

Review.create(rating: 1, user_id: 1, recording_id: 1, description: "The Beach Boys are a revelation.")


