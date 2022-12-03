class Item
  attr_reader :archived
  attr_accessor :id, :genre, :author, :source, :label, :publish_date

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..100)
    @genre = []
    @author = []
    @source = []
    @label = []
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre << genre unless @genre.include?(genre)
  end

  def add_author(author)
    @author << author unless @author.include?(author)
  end

  def add_source(source)
    @source << source unless @source.include?(source)
  end

  def add_label(label)
    @label << label unless @label.include?(label)
  end

  def can_be_archived?
    return true if @publish_date < (Time.now.year - 10).to_s

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
