require 'spec_helper'

describe "User pages" do

 	subject { page }

	describe "Sign up" do
	                     #visit 'root_path'
	    before { visit '/users/new'  }

	    it { should have_selector('h1', :text => 'Sign up') }

	    # it { page.should have_selector('title', :text => "#{base_title}") }
	    it { should have_selector('title', text: full_title('Sign up')) }

	    #it { page.should_not have_selector('title', :text => "| Home") }
	 end 

end 