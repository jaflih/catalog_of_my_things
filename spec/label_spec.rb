require_relative '../application/label'
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
      expect(@label).to eq 'movie'
    end

    it '@label.color Should return color' do
      expect(@label).to eq 'green'
    end
  end
end
