require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  
  describe "GET #index" do
    login_user
    
    context "when request sets accept => application/html" do
    
      before(:each) do        
        get :index       
      end    
      
      it "returns http success" do                          
        expect(response).to have_http_status(:success)
      end
      
      it "renders the index template" do
        expect(response).to render_template("index") 
      end

    end  
    
    context "when request sets accept => application/json" do

      todo_list_size = 2
      
      before(:each) do        
        todo_list_size.times do |x|
          Todo.create!(name: "todo #{x}", user_id: subject.current_user.id)
        end

        request.accept = "application/json"
        get :index
      end

      it "returns json success" do        
        expect(response).to have_http_status(:success)
      end

      it "responds to current user todo list" do
        response_body = JSON.parse(response.body)

        todos = response_body.select do |todo| 
          todo['user_id'].to_s
            .include?("#{subject.current_user.id}") 
        end

        expect(todos).not_to be_empty        
        expect(todos.size).to eq(todo_list_size)
      end

    end

  end

  describe "POST #create API" do
    login_user

    before(:each) do 
      request.accept = 'application/json'
      post :create, { :name => 'todo', :user => subject.current_user }      
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)            
    end
    
    it "responds to current user provided in the params" do    
      new_todo = JSON.parse(response.body)

      expect(new_todo['user_id']).to eq(subject.current_user.id)
    end

  end  
  
end
