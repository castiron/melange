require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'is invalid without an email address' do
    expect(build :user, :email => nil).to_not be_valid
  end

    it 'is invalid without a password before it is persisted' do
    expect(build :user, :password => nil).to_not be_valid
  end

end
