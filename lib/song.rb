require "pry"

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
    new_song = self.new 
    new_song.name = name  
    new_song 
  end 

  def self.create_by_name(name)
    new_song = self.new 
    new_song.name = name 
    @@all << new_song
    new_song  
  end 

  def self.find_by_name(name)
    find_song = self.new
    find_song.name = name 
    @@all.find do |song|
    song.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
   @@all.sort_by! do |song|
    song.name 
    end 
   end 
 
  def self.new_from_filename(filename)
    filename = filename.delete_suffix(".mp3")
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]

    song = self.new 
    song.name = song_name 
    song.artist_name = artist_name 
    song 
  end 
 

  def self.create_from_filename(name)
    name = name.delete_suffix(".mp3")
    parts = name.split(" - ")
    artist_name = parts[0]
    song_name = parts[1]

    song = self.create 
    song.name = song_name 
    song.artist_name = artist_name 
    song 
  end 

  def self.destroy_all
  @@all.clear  
  
  end

end 

 


