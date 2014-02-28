require 'spec_helper'

describe TodosController do

  let(:token) { double :accessible? => true }

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    controller.stub(:doorkeeper_token) { token }
  end

  describe "GET index" do
    
    it 'should load the correct number of items' do
      a_todo = FactoryGirl.create(:todo, {user: @user})
      another_todo = FactoryGirl.create(:todo, {user: @user})

      get :index
      response.should be_success
      assigns(:todos).size.should == 2
    end

    it 'should load the correct number of items with json' do
      a_todo = FactoryGirl.create(:todo, {user: @user})
      another_todo = FactoryGirl.create(:todo, {user: @user})

      get :index, :format => :json
      response.should be_success
      assigns(:todos).size.should == 2
    end

  end


  describe "GET show a todo" do
    
    it 'should load the correct item' do
      a_todo = FactoryGirl.create(:todo, {user: @user})

      get :show, :id => a_todo.id
      response.should be_success
      assigns(:todo).should_not be_nil      
      assigns(:todo).description.should == a_todo.description
    end

    it 'should load the correct item with json' do
      a_todo = FactoryGirl.create(:todo, {user: @user})

      get :show, :id => a_todo.id, :format => :json
      response.should be_success
      assigns(:todo).should_not be_nil
    end

  end


  describe "POST create a todo" do
    
    it 'should create a new todo' do
      post :create, {:todo => 
        {:description => 'A', :priority => 1, :due_date => {:i1 => 2008, :i2 => 10, :i3 => 10, :i4 => 14, :i5 => 30}}
        }
      response.should be_redirect
      @user.todos.where(:description => 'A').count.should == 1
    end


    it 'should create a new todo' do
      request.accept = "application/json"
      post :create, {:todo => 
        {:description => 'A', :priority => 1, 'due_date(1i)' => 2008, 'due_date(2i)' => 10, 'due_date(3i)' => 10, 'due_date(4i)' => 14, 'due_date(5i)' => 30}}, 
      :format => :json
      response.should be_success
      res_js = JSON.parse(response.body)
      res_js["due_date"].should match /2008-10-10T14:30/
      @user.todos.where(:description => 'A').count.should == 1
    end


    it 'should show an error for failed invalid input' do
      post :create, {:todo => 
        {:description => '', :priority => 1, 'due_date(1i)' => 2008, 'due_date(2i)' => 10, 'due_date(3i)' => 10, 'due_date(4i)' => 14, 'due_date(5i)' => 30}}
      response.should be_redirect
      flash[:error].should match(/Description/)
    end

    it 'should show an error for failed invalid input when using json' do
      request.accept = "application/json"
      post :create, {:todo => 
        {:description => '', :priority => 1, 'due_date(1i)' => 2008, 'due_date(2i)' => 10, 'due_date(3i)' => 10, 'due_date(4i)' => 14, 'due_date(5i)' => 30}},
      :format => :json
      response.status.should == 422
    end

  end


end
