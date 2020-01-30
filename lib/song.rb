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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(input)
    song = Song.new
    song.name = input
    song
  end

  def self.create_by_name(input)
    song = Song.new
    song.name = input
    song.save
    song
  end

  def self.find_by_name(input)
    Song.all.find{|song| song.name == input}
  end

  def self.find_or_create_by_name(input)
    if !self.find_by_name(input)
      self.create_by_name(input)
    else 
      self.find_by_name(input)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(input)
    round2 = input.split(".")
    round2.pop 
    round3 = round2[0].split(" - ")
    round4 = Song.create_by_name(round3[1])
    round4.artist_name = round3[0]
    return round4   
  end

  def self.create_from_filename(input)
    round2 = input.split(".")
    round2.pop 
    round3 = round2[0].split(" - ")
    round4 = Song.create_by_name(round3[1])
    round4.artist_name = round3[0]
    round4.save
  end

  def self.destroy_all
  @@all = []
  end
end