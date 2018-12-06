require 'rails_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :contact_name => "MyString",
      :contact_email => "MyString@gmail.com",
      :contact_subject => "MyString",
      :contact_message => "MyText"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input[name=?]", "contact[contact_name]"

      assert_select "input[name=?]", "contact[contact_email]"

      assert_select "input[name=?]", "contact[contact_subject]"

      assert_select "textarea[name=?]", "contact[contact_message]"
    end
  end
end
