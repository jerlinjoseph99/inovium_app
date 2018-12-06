require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
        :contact_name => "Name",
        :contact_email => "Email@example.com",
        :contact_subject => "Subject",
        :contact_message => "MyText"
      ),
      Contact.create!(
        :contact_name => "Name",
        :contact_email => "Email@example.com",
        :contact_subject => "Subject",
        :contact_message => "MyText"
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email@example.com".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
