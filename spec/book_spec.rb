require_relative '../application/book'
describe 'Book class' do
  before(:all) do
    @book = Book.new('james bond', 'cover_state', '2021-10-02', archived: false)
  end
  context 'Create the book class' do
    it 'book should have an instance Book class' do
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
    it 'can_be_archived should return true if parent method return true or cover_state equals bad' do
      @book = Book.new('james bond', 'bad', '2021-10-02', archived: true)
      @book.move_to_archive
      expect(@book.archived).to eq true
    end

    it 'can_be_archived should return false if parent method return false or cover_state not equals bad' do
      @book = Book.new('james bond', 'state', '2021-10-02', archived: false)
      @book.move_to_archive
      expect(@book.archived).to eq false
    end
  end
end
