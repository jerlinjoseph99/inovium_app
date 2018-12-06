# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact/send_contact_mail
  def send_contact_mail
    ContactMailer.send_contact_mail
  end

end
