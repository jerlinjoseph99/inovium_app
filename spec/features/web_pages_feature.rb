require 'rails_helper'


RSpec.feature "Website -- " do
  
  def test_navbar
     # Check for navbar menu start
     expect(page).to have_link('Home', href: pages_home_path)
     expect(page).to have_link('Faq', href: pages_faq_path)
     expect(page).to have_link('About', href: pages_about_path)
     expect(page).to have_link('Science', href: pages_science_path)
     #expect(page).to have_link(nil, href: 'Contact')
     # Check for navbar menu end
  end
  
  def test_footer
      
  end
    
  scenario "User visits the home page" do
     
     visit "/"
     
     # Check for key contents on the page start
     expect(page).to have_selector('h5', text: 'Inovium Labs')
     # Check for key contents on the page start
     
     test_navbar
     
     # Check for css selectors on the page start
     expect(page).to have_selector("footer")
     # Check for css selectors on the page end
     
     test_footer
     
     
     
     
  end
  
  scenario "User visits contact page" do
     
     #visit  new_contact_path
     
     #expect(page).to have_selector('h2', text: 'Have any questions on mind?')
     #expect(page).to have_button('SUBMIT')
      
  end
  
  scenario "User visits science page" do
      
     pending("Have to implement")
     
     visit "/"
     click_link 'Science'
     
     expect(page).to have_selector('h1', text: 'Science')
     
     test_navbar
     
     
     test_footer
      
  end
  
  scenario "User visits faq page" do
     
     
      
  end
  
end