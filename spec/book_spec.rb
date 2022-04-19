require_relative '../application/book'
describe 'Book class' do
  before(:all) do
    @book = Book.new
  end
  context 'Create the book class' do
    it 'Book class should have an instance Book class' do
      expect(@book).to be_an_instance_of Book
    end
  end
end

