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
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end 
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
    # returns either nil or an instance of song
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song
      song
    else
      self.create_by_name(name)
    end
  end
#binding.pry

  def self.alphabetical
    sort = all.sort_by{ |song| song.name}
    sort
  end
  
  def self.new_from_filename(file)
    new = self.new_by_name(file)
    new.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    new.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    new
    #binding.pry
 end
 

  def self.create_from_filename(file)
    new = self.create_by_name(file)
    new.name = file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    new.artist_name = file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    new.save
  end
     #binding.pry
  def self.destroy_all
    @@all = []
  end
end
