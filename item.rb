class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :source, :label, :publish_date

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
  end

  def add_author(author)
    @author << author
  end

  def add_source(source)
    @source << source
  end

  def add_label(label)
    @label << label
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
