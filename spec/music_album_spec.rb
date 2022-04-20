require_relative '../application/music_album'
require_relative '../application/item'

describe MusicAlbum do
  context 'when Instantiated' do
    before(:each) do
      @music_album = MusicAlbum.new(true, '2010-04-19', true)
    end

    it 'Create instance of music album class' do
      expect(@music_album.instance_of?(MusicAlbum)).to be(true)
    end

    it 'If instance of MusicAlbum is type of Item' do
      expect(@music_album.instance_of?(MusicAlbum)).to be(true)
    end

    it 'instance of on spotify property' do
      instance_property = @music_album.on_spotify
      expect(instance_property).to eq(true)
    end
  end
end
