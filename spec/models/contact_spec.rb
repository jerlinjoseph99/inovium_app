require 'rails_helper'

RSpec.describe Contact, type: :model do
  contact = Contact.new 
  
  it "is valid with invalid without valid attributes" do
    expect(contact).to_not be_valid
  end
  
  it "is not valid without a name" do
    contact.contact_name =  nil
    expect(contact).to_not be_valid
   end
  
  it "is not valid without an email" do
    contact.contact_email= nil
    expect(contact).to_not be_valid
   end
   
   it "is not valid without a subject" do
    contact.contact_subject = nil
    expect(contact).to_not be_valid
   end
   
   it "is valid with valid attributes" do
    contact.contact_name = "John Doe"
    contact.contact_email=  "johndoe@example.com"
    contact.contact_subject =  "Get treatment"
    contact.contact_message =  "Lorem Ipsum"   
    expect(contact).to be_valid
  end
  
  it "is not valid with invalid email format" do
    contact.contact_email= "jjkkk.com"
    expect(contact).to_not be_valid
   end
  
end
