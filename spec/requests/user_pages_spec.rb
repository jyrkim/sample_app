require 'spec_helper'
#require "app/helpers/user_helper"

describe "User pages" do

 	subject { page }

 	#visit '/users/new'
	let(:users_new_path) {"/users/new"}

	describe "Sign up page" do
	    
	    before { visit "#{users_new_path}"  }

	    it { should have_selector('h1', :text => 'Sign up') }

	    # it { page.should have_selector('title', :text => "#{base_title}") }
	    #it { should have_selector('title', text: full_title('Sign up')) }
	    it { should have_selector('title', text: 'Sign up') }

	    #it { page.should_not have_selector('title', :text => "| Home") }
	 end 

	 describe "profile page" do

	    let(:user) { FactoryGirl.create(:user)}
	    			#/users/id                
	    before { visit user_path(user)  }

	    it { should have_selector('h1',  text: user.name ) }
	    it { should have_selector('title', text: user.name) }

	 end

	 describe "signup" do

	 	#before { visit signup_path  }
	 	before { visit "#{users_new_path}"  }
	 	#before { visit "users/new"  }


	 	let(:submit) { "Create my account" }

	 	describe "with invalid information" do

	 	 	it "should not create a user" do
	 	 		expect { click_button submit}.not_to change(User, :count)
	 	 	end 	
	 	end

	 	describe "with valid information" do

	 	 	before do
	 	 		fill_in "Name", with: "Bart Simpson"
	 	 		fill_in "Email", with: "Bart.Simpson@springfield.org"
	 	 		fill_in "Password", with: "foobar"
	 	 		fill_in "Confirmation", with: "foobar"
	 	 	end

	 	 	it "should create a user" do
	 	 		expect { click_button submit }.to change(User, :count).by(1)
	 	 	end 	
	 	end

	 end 

end 