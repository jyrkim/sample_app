require 'spec_helper'

describe "MicropostPages" do


  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in user }

  describe "micropost creation" do

  	before { visit '/static_pages/home' }

  	describe "with invalid information" do

  		it "should not create a micropost" do
  			expect { click_button "Post" }.should_not change(Micropost, :count) 
  		end

  		describe "error messages" do
  			before { click_button "Post"}

  			it { should have_content('error') }
  		end
  	end

  	describe "with valid information" do

  		before { fill_in 'micropost_content', with: "Lorem ipsum" }

		  it "should create a micropost" do
  			expect { click_button "Post" }.should change(Micropost, :count) 
  		end
  	end

    describe "visiting another user's microposts page" do

      let(:user2) { FactoryGirl.create(:user)}
      let(:m1) { FactoryGirl.create(:micropost, user: user2, content: "Foo") }
      #et(:user2) { FactoryGirl.create(:micropost, user: :user2 )}
      #let(:user2) { FactoryGirl.create(:micropost, user: FactoryGirl.create(:user) )}

      before do
        visit user_path(:user2)
      end

      it "should not have delete links create a micropost" do
        should_not have_content("delete") 
      end
    end
  end

  describe "micropost destruction" do

    let(:m1) { FactoryGirl.create(:micropost, user: user, content: "Foo") }

    #let(:user) { FactoryGirl.create(:micropost, user: user) }

    describe "as correct user" do

      before { visit '/static_pages/home' }

      it "should delete a micropost" do
        expect { click_link "delete"}.should change(Micropost, :count).by(-1)
      end
    end

  end
end
