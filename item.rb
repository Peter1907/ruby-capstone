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
    @genre << genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author << author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source << source
    source.add_item(self) unless source.items.include?(self)
  end

  def add_label(label)
    @label << label
    label.add_item(self) unless label.items.include?(self)
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
