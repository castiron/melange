require 'rails_helper'

RSpec.describe "accounts/edit", :type => :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :name => "MyString",
      :primary_contact_id => 1,
      :active => false,
      :balance => "9.99"
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_name[name=?]", "account[name]"

      assert_select "input#account_primary_contact_id[name=?]", "account[primary_contact_id]"

      assert_select "input#account_active[name=?]", "account[active]"

      assert_select "input#account_balance[name=?]", "account[balance]"
    end
  end
end