
# MusicLyricSearch
Song Lyrics Search

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Domain model with attributes:

                  Artist
                     |
                     ^
               Recording –< Review >– User
                    v
                    |
                 Song

User: first_name(str), last_name(str), username (str), email(str), password_digest(str), age(int), country(str), img_url(str)

Review: rating (int), user_id (int), recording_id (int), description (text)

Song: name(str), lyrics (text)

Recording:  link (str - odesli url), artist_id(int), song_id(int)

Artist: name(str)




Song
has_many :recordings
has_many :artist, through: :recordings

Recording
has_many :reviews
has_many :users, through: :reviews
belongs_to :artist
belongs_to :song

Review
belongs_to :user
belongs_to :recording

User
has_many :reviews
has_many :recordings, through: :reviews

Artist
has_many :recordings
has_many :songs, through: :recordings





User Stories:

Example:  

User will be able to:
browse available songs based on phrases (Read)
write reviews and rate song (Create)
edit their review (Update)
delete their review (Delete)
CRUD their user profile
view artist bio for a specific song and
visit a link to stream / purchase that song. (Read)
Etc.

Stretch Goals (after MVP):
Get song info from an API
Add CSS styling
Etc.