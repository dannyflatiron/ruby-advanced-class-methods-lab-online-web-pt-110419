require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
    # binding.pry
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect {|object| object.name == song_name}

  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      return self.find_by_name(song_name)
    else
    self.create_by_name(song_name)
  end
  end

  def self.alphabetical
    self.all.sort_by {|object| object.name}
  end

  def self.new_from_filename(artist_name_song_name)
    c = self.new
   c.name = artist_name_song_name.split(/[^a-zA-Z\s]|\s-\s/)[1]
   c.artist_name = artist_name_song_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
   c
  end

  def self.create_from_filename(artist_name_song_name)
    c = self.new
   c.name = artist_name_song_name.split(/[^a-zA-Z\s]|\s-\s/)[1]
   c.artist_name = artist_name_song_name.split(/[^a-zA-Z\s]|\s-\s/)[0]
   c.save
   c
  end

  def self.destroy_all
    self.all.clear
  end
end
