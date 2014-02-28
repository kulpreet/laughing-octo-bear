require 'spec_helper'

describe UsersController do

  let(:token) { double :accessible? => true }

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    controller.stub(:doorkeeper_token) { token }
  end

  describe "GET 'show'" do
    
    it "should be successful" do
      get :show, :id => @user.id
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user.id
      assigns(:user).should == @user
    end
    
  end

end
