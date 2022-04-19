require_relative '../application/label'
describe 'Class label' do
  before(:all) do
    @label = Label.new
  end

  context 'Label class instance' do
    it '@label Should be an instance of class Label' do
      expect(@label).to be_an_instance_of Label
    end
  end
end
