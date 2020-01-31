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
    song = self.new # initializes sets it to song variable
    song.save # song variable gets shoveled/saved to @@all
    song #returns the whole instance 
  end

  def self.new_by_name(song_name) #song_name = Best_Part
    song = self.new # initializes sets it to song variable
    song.name = song_name # argument 'song_name' gets set to the instance variable name
    song # returns song the whole instance
  end  

  def self.create_by_name(song_name) #song_name = Best_Part
    song = self.create # calls on the .create class method which will initialize, set the song_name to the song variable and save the song to @@all
    song.name = song_name # argument 'song_name' gets set to the instance variable name, which when called(like this: song.name) only outputs the name of the song
    song # returns whole instance Song: ID Name: Best_Part, not just "Best Part"
  end  

  def self.find_by_name(song_name) #song_name = Best_Part
    self.all.find do |song| # song is every instance that went through this class funtion, song.name is the actual songs name
      song.name == song_name
    end
  end  

  def self.find_or_create_by_name(song) #song_name = Best_Part
    if self.find_by_name(song)
      return self.find_by_name(song)
    else 
      self.create_by_name(song)
    end
  end    

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end 
  end

  def self.new_from_filename(filename)
    arr = filename.split(/ - /)
    artist = arr[0]
    song_in_arr = arr[1].split(/.mp3/)
    song_name = song_in_arr[0]
    
    song = self.new
    song.name = song_name
    song.artist_name = artist 
    song
  end

  def self.create_from_filename(filename)
    arr = filename.split(/ - /)
    artist = arr[0]
    song_in_arr = arr[1].split(/.mp3/)
    song_name = song_in_arr[0]

    song = self.create
    song.name = song_name
    song.artist_name = artist 
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# Best_Part = Song.create





