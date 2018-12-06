require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :contact_name => "MyString",
      :contact_email => "MyString@gmail.com",
      :contact_subject => "MyString",
      :contact_message => "MyText"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input[name=?]", "contact[contact_name]"

      assert_select "input[name=?]", "contact[contact_email]"

      assert_select "input[name=?]", "contact[contact_subject]"

      assert_select "textarea[name=?]", "contact[contact_message]"
    end
  end
end
