require_relative '../application/item'

describe 'Item' do
  before(:each) do
    @item = Item.new('1999/02/02', true)
  end
  it 'Check properties' do
    expect(@item.id).to be_truthy
    expect(@item.id).to satisfy('less than 1001') { |v| v <= 1000 }
    expect(@item.id).to satisfy('more than 0') { |v| v >= 1 }
    expect(@item.publish_date).to eq '1999/02/02'
    expect(@item.archived).to eq true
  end

  it 'Update properties' do
    @item.genre = 'Genre'
    @item.author = 'Author'
    @item.source = 'Source'
    @item.label = 'Label'
    @item.publish_date = '1999/02/03'

    expect(@item.genre).to eq 'Genre'
    expect(@item.author).to eq 'Author'
    expect(@item.source).to eq 'Source'
    expect(@item.label).to eq 'Label'
    expect(@item.publish_date).to eq '1999/02/03'

    expect { @item.id = 1 }.to raise_error(NoMethodError)
    expect { @item.archived = false }.to raise_error(NoMethodError)
  end

  it 'Check move_to_archive if publish_date > 10 and archived = true' do
    @item.move_to_archive
    expect(@item.archived).to eq true
  end

  it 'Check move_to_archive if publish_date > 10 and archived = false' do
    item2 = Item.new('1999/02/03', false)
    item2.move_to_archive
    expect(item2.archived).to eq true
  end

  it 'Check move_to_archive if publish_date < 10 and archived = true' do
    item2 = Item.new('2022/02/02', true)
    item2.move_to_archive
    expect(item2.archived).to eq true
  end

  it 'Check move_to_archive if publish_date < 10 and archived = false' do
    item2 = Item.new('2022/02/02', false)
    item2.move_to_archive
    expect(item2.archived).to eq false
  end
end
