class ContactMailer < ApplicationMailer
 default :from => 'support@inoviumlabs.com'
    
  
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_contact_mail(contact)
    @contact = contact
    mail( :to => ENV["RECIEVER_EMAIL"],:subject => 'Thanks for contacting us!' )
  end
  
end