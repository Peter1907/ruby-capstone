require_relative '../music_album'
describe MusicAlbum do
  context 'Testing Music album' do
    music_album = MusicAlbum.new('10/10/2010', true, true)
    it 'it creates a music album instance' do
      expect(music_album.publish_date).to eq('10/10/2010')
    end
    it 'it checks if music album can be archived' do
      expect(music_album.can_be_archived?).to eq(true)
    end
  end
end
