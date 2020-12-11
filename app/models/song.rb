class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  def self.play_count_above(threshold)
    where("play_count > #{threshold}").count
  end

  def self.shortest_two
     order('length asc').limit(2)
  end

  def self.most_recently_updated
    Song.order(updated_at: :desc).limit(1).first
  end
end
