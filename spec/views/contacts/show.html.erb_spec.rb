require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :contact_name => "Name",
      :contact_email => "Email@example.com",
      :contact_subject => "Subject",
      :contact_message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
  end
end
