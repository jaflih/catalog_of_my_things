describe 'Class label' do
  before(:all) do
    @label = Label.new
  end

  context 'Label class instance' do
    expect(@label).to be_an_instance_of Label
  end
end
