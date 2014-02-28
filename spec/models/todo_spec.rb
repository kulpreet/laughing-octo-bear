require 'spec_helper'

describe Todo do
  
  it 'should load a todo' do
    td = FactoryGirl.create(:todo)
    td.description.should == 'A description'
  end
end
