require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  
  let!(:first_todo) {
  	Todo.create(:name => "Test Title", :description => "Test Body")
  }

  describe "GET #index" do
  	before { get :index }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "renders the index template" do
    	expect(response).to render_template("index") 
		end
    context "when request sets accept => application/json" do
    	before {
    		request.accept = "application/json"
	      get :index       
    	}
	    it "returns json success" do	      	    	
	      expect(response).to have_http_status(:success)
	    end
		end
  end

  describe "GET #show" do
  	before {
		request.accept = "application/json"
    	get :index       
		}
		it "returns json success" do	      	    	
     	expect(response).to have_http_status(:success)
    end
  	#it "assigns" do
  	#	expect(response.body).to eq(:first_todo)
  	#end
  end

end
