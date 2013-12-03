require 'spec_helper'
#require 'capybara/rails'
#require "app/helpers/user_helper"
#include SessionsHelper

describe "User pages" do

 	subject { page }

 	#visit '/users/new'
	#let(:users_new_path) {"/users/new"}

  	describe "signup page" do

    	before { visit signup_path }

    	it { should have_selector('h1', text: 'Sign up') }
    	it { should have_selector('title', text: full_title('Sign up')) }
  	end

	describe "index" do

	 	before do
	      sign_in FactoryGirl.create(:user)
	      FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
	      FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
	      visit users_path
	    end

	it { should have_selector('title', text: 'All users') }
	it { should have_selector('h1', text: 'All users')}
	end
 end

