require_relative '../author'
require_relative '../item'

describe Author do
  context 'should create an instance of Author class' do
    author = Author.new('John', 'Doe')
    item = Item.new('2010')

    it 'should take 2 parameters and return an Author object' do
      expect(author).to be_an_instance_of(Author)
    end

    it 'should have a first and last name' do
      expect(author.first_name).to eq('John')
      expect(author.last_name).to eq('Doe')
    end

    it 'should add item to author' do
      author.add_item(item)
      expect(author.items).to eq([item])
    end

    it 'should add author to item' do
      expect(item.author).to eq([author])
    end
  end
end
