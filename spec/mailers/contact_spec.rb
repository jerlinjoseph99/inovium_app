require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  describe "send_contact_mail" do
    
    before do
      
      @contact1 = Contact.create(contact_name: "jerlin", contact_email: "jerlinj@gmail.com", contact_subject: "Need info", contact_message: "I need the following information")
      
    end
    
    let(:mail) { ContactMailer.send_contact_mail(@contact1) }
    
    
    it "renders the body" do
      expect(mail.body.encoded).to match("Contact information")
      expect(mail.body.encoded).to match(@contact1.contact_name)
      expect(mail.body.encoded).to match(@contact1.contact_email)
      expect(mail.body.encoded).to match(@contact1.contact_subject)
      expect(mail.body.encoded).to match(@contact1.contact_message)
    end
    
    it 'renders the subject' do
      expect(mail.subject).to eq('Thanks for contacting us!')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['jerlin.urbanecho@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@inoviumlabs.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(@contact1.contact_name)
    end

    it 'assigns @confirmation_url' do
      #expect(mail.body.encoded)
       # .to match("http://aplication_url/#{user.id}/confirmation")
    end
    
    
    
  end

end
