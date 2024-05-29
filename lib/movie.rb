class Movie
  attr_accessor :title, :genre, :shows

  def initialize(title, genre)
    @title = title
    @genre = genre
    @shows = []
  end

  def add_show(show)
    @shows << show
  end
end
