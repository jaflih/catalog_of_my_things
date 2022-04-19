require_relative '../application/book'
describe 'Book class' do
  before(:all) do
    @book = Book.new('james bond', 'cover_state', '2021-10-02', false)
  end
  context 'Create the book class' do
    it 'book class should have an instance Book class' do
      expect(@book).to be_an_instance_of Book
    end
  end

  context 'book to have attribute publisher and cover state' do
    it 'Publisher attribute should return james bond' do
      expect(@book.publisher).to eq 'james bond'
    end

    it 'cover_state attribute should return cover_state' do
      expect(@book.cover_state).to eq 'cover_state'
    end
  end

  context 'can_archived method' do
    it 'can_archived should return true if parent method return true or cover_state equals bad' do
      @book = Book.new('james bond', 'bad', '2021-10-02', false)
      expect(@book.can_be_archived?).to eq true
    end
  end
end
