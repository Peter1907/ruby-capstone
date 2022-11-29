class Item
  def initialize(publish_date, archived: false)
    @id = rand[0..100]
    @genre = []
    @author = []
    @source = []
    @label = []
    @publish_date = publish_date
    @archived = archived
  end

  def add_genre(genre)
    @genre << Genre.new(genre)
  end

  def add_author(author)
    @author << Author.new(author)
  end

  def add_source(source)
    @source << Source.new(source)
  end

  def add_label(label)
    @label << Label.new(label)
  end

  def can_be_archived?
    return true if @publish_date < (Time.now.year - 10).to_s
    return false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private :can_be_archived?
end
