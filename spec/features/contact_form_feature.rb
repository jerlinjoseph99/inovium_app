require 'rails_helper'


RSpec.feature "Contact form --" do
  
  before do
    
     @contact1 = Contact.create(contact_name: "jerlin", contact_email: "jerlinj@gmail.com", contact_subject: "Need info", contact_message: "I need the following information")
     @contact2 = Contact.create(contact_name: "Rambo", contact_email: "rambo@gmail.com", contact_subject: "Need ammo", contact_message: "I need the following ammunition")
     
  end
    
  scenario "User submits a contact form successfully" do
     
     visit new_contact_path
     
     fill_in 'contact[contact_name]', with: 'John Doe'
     fill_in 'contact[contact_email]', with: 'john@example.com'
     fill_in 'contact[contact_subject]', with: 'Testing contact form'
     fill_in 'contact[contact_message]', with: 'This is a very short message that test contact form'
     
     click_button 'SUBMIT'
     
     expect(page).to have_content("Contact was successfully created")
     expect(page).to have_current_path(new_contact_path)
     
     
  end
  
  
  scenario "User fails to submit a contact form" do
     
     visit new_contact_path
     
     fill_in 'contact[contact_name]', with: 'John Doe'
     fill_in 'contact[contact_email]', with: ''
     fill_in 'contact[contact_subject]', with: 'Testing contact form'
     fill_in 'contact[contact_message]', with: 'This is a very short message that test contact form'
     
     click_button 'SUBMIT'
     
     expect(page).to have_content("Contact email can't be blank") 
     expect(page).to have_current_path(contacts_path)
      
  end
  
  scenario "User cannot view contacts" do
      
  end
  
  scenario "User cannot delete contacts" do
      
  end
  
  scenario "User cannot lists contacts" do
      
  end
  
  scenario "Admin lists all the contacts" do
    
     visit contacts_path
     
    
     expect(page).to have_content('Details of the users coming through the contact form.')
     
     expect(page).to have_content(@contact1.contact_name)
     expect(page).to have_content(@contact1.contact_email)
     expect(page).to have_content(@contact1.contact_subject)
     expect(page).to have_content(@contact1.contact_message)
     
     expect(page).to have_content(@contact2.contact_name)
     expect(page).to have_content(@contact2.contact_email)
     expect(page).to have_content(@contact2.contact_subject)
     expect(page).to have_content(@contact2.contact_message)
     
     expect(page).to have_link('', href: contact_path(@contact1))
     expect(page).to have_link('', href: edit_contact_path(@contact1))
     expect(page).to have_link('', href: contact_path(@contact1))
     

      
  end
  
  scenario "Admin checks an individual contact details" do
      
  end
  
  scenario "Admin deletes a contact" do
      
  end
  
  
  
  
  
  
end