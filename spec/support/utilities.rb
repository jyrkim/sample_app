include ApplicationHelper
# Uncomment below to use
#def full_title(page_title)
#	base_title = "Ruby on Rails Tutorial Sample App"

#	if page_title.empty?
#		base_title
#	else
		#puts "test #{base_title} | #{page_title}"
#		"#{base_title} | #{page_title}"
#	end
#end

def sign_in(user)
	#puts signin_path
	visit  signin_path  #'/sessions/signin'
	fill_in "Email", with: user.email.upcase
    fill_in "Password", with: user.password
    click_button "Sign in"
    # Sign in when not using Capybara as well
    cookies[:remember_token] = user.remember_token
end

RSpec::Matchers::define :have_title do |text|
  match do |page|
    Capybara.string(page.body).has_selector?('title', text: text)
  end
end
