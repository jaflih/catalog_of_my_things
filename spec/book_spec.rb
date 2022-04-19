require_relative '../application/book'
describe 'Book class' do
  before(:all) do
    @book = Book.new('james bond', 'cover_state')
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
  end
end
