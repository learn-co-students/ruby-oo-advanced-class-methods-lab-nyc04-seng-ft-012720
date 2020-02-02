class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  

  def save
    self.class.all << self
    # Song.all << self
  end

  

  def self.create
    song = self.new
    @@all << song
    song
  end 
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    @@all << song 
    song
    
  end
  
  def self.create_by_name(music)
    song = self.new 
    song.name = music 
    @@all << song 
    song
  end 

  def self.find_by_name(find_name)
      @@all.find{|find_song| find_song.name == find_name}

  end 

  def self.find_or_create_by_name(song_name)
            if self.find_by_name(song_name)
            self.find_by_name(song_name)
          else self.create_by_name(song_name)

          end 
  end 

  def self.alphabetical 
      @@all.sort_by{|song| song.name}
  end 

  def self.new_from_filename(file_name) 
    # x = file_name.split()
    song = file_name.split(/[-.]/)
    x = Song.new
    x.artist_name = song[0].strip
    x.name = song[1].strip
    x
  end 

  def self.create_from_filename(file_name)
    song = file_name.split(/[-.]/)
    x = Song.new
    x.artist_name = song[0].strip
    x.name = song[1].strip
    x
    @@all << x
  end

  def self.destroy_all
    # self.all.clear
    @@all = []
  end
end

