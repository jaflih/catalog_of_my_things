require_relative '../application/genre'
require_relative '../application/item'

describe Genre do
  context 'When instantiated' do
    before(:all) do
      @genre = Genre.new('Pop music')
    end

    context 'Genre class instance' do
      it '@genre Should be an instance of class Genre' do
        expect(@genre).to be_an_instance_of Genre
      end
    end

    context '@genre should have attribute name' do
      it '@label.title Should return name' do
        expect(@genre.name).to eq 'Pop music'
      end
    end
  end

  context '@genre should have attribute items defautl to []' do
    it '@label.items Should return []' do
      expect(@genre.items).to eq []
    end
  end

  context '@genre should add an item ' do
    it '@label.items Should return [item]' do
      item = Item.new('1999/02/02', true)
      @genre.add_item(item)
      expect(@genre.items).to eq [item]
      expect(item.genre).to eq @genre
    end
  end
end
