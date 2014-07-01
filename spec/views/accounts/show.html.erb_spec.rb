require 'rails_helper'

RSpec.describe "accounts/show", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "Name",
      :primary_contact_id => 1,
      :active => false,
      :balance => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
  end
end
