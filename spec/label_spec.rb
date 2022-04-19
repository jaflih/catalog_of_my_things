require_relative '../application/label'
require_relative '../application/item'

describe 'Class label' do
  before(:all) do
    @label = Label.new('movie', 'green')
  end

  context 'Label class instance' do
    it '@label Should be an instance of class Label' do
      expect(@label).to be_an_instance_of Label
    end
  end

  context '@label should have attribute color and title' do
    it '@label.title Should return title' do
      expect(@label.title).to eq 'movie'
    end

    it '@label.color Should return color' do
      expect(@label.color).to eq 'green'
    end
  end

  context 'add_item Method in the Label class' do
    item = Item.new('2021-10-03', true)
    before(:all) do
      @label.add_item(item)
    end
    it 'Items should have one (1) element in it' do
      item_length = @label.items.length
      expect(item_length).to eq 1
    end
  end
end
