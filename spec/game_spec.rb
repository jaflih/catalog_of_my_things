require './application/game'
require './application/item'

describe 'Game' do
  before(:each) do
    @game = Game.new('2020/02/02', true, true, '2022/02/02')
  end
  it 'Check properties' do
    expect(@game.multiplayer).to eq true
    expect(@game.last_played_at).to eq '2022/02/02'
    expect(@game.id).to be_truthy
    expect(@game.id).to satisfy('less than 1001') { |v| v <= 1000 }
    expect(@game.id).to satisfy('more than 0') { |v| v >= 1 }
    expect(@game.publish_date).to eq '2020/02/02'
    expect(@game.archived).to eq true
  end

  it 'Update properties' do
    @game.genre = 'Genre'
    @game.author = 'Author'
    @game.source = 'Source'
    @game.label = 'Label'
    @game.publish_date = '1999/02/03'
    @game.multiplayer = false
    @game.last_played_at = '2022/04/04'

    expect(@game.genre).to eq 'Genre'
    expect(@game.author).to eq 'Author'
    expect(@game.source).to eq 'Source'
    expect(@game.label).to eq 'Label'
    expect(@game.publish_date).to eq '1999/02/03'

    expect(@game.multiplayer).to eq false
    expect(@game.last_played_at).to eq '2022/04/04'

    expect { @game.id = 1 }.to raise_error(NoMethodError)
    expect { @game.archived = false }.to raise_error(NoMethodError)
  end

  it 'Check than Game instance of Item' do
    expect(@game).to be_a Item
  end
end
