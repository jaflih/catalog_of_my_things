require './application/author'

describe 'Author' do
  before(:each) do
    @author = Author.new('stephen', 'king')
  end
  it 'Check properties' do
    expect(@author.id).to be_truthy
    expect(@author.id).to satisfy('less than 1001') { |v| v <= 1000 }
    expect(@author.id).to satisfy('more than 0') { |v| v >= 1 }
    expect(@author.first_name).to eq 'stephen'
    expect(@author.last_name).to eq 'king'
    expect(@author.items).to eq []
  end

  it 'Update properties' do
    @author.first_name = 'Stephen'
    @author.last_name = 'King'
    expect(@author.first_name).to eq 'Stephen'
    expect(@author.last_name).to eq 'King'

    expect { @author.id = 1 }.to raise_error(NoMethodError)
    expect { @author.items = [1] }.to raise_error(NoMethodError)
  end
end
