require 'rails_helper'

RSpec.describe User, :type => :model do

  let(:credentials) {
    { :password => 'testtest123', :email => 'test@castironcoding.com' }
  }

  let(:ip_address) {
    '127.0.0.1'
  }

  it 'is invalid without an email address' do
    expect(build :user, :email => nil).to_not be_valid
  end

  it 'is invalid without a password before it is persisted' do
    expect(build :user, :password => nil).to_not be_valid
  end

  it 'is invalid without a first_name' do
    expect(build :user, :first_name => nil).to_not be_valid
  end

  it 'is invalid without a last_name' do
    expect(build :user, :last_name => nil).to_not be_valid
  end

  it 'is invalid without a password_digest after it is persisted' do
    user = create :user
    user.password_digest = nil
    expect(user).to_not be_valid
  end

  it 'authenticates with the correct email and password' do
    user = create :user, credentials
    expect(User.authenticate(credentials[:email], credentials[:password], ip_address)).to eq user
  end

  it 'does not authenticate with the incorrect email and password' do
    user = create :user, credentials
    expect(User.authenticate(credentials[:email], credentials[:password] * 2, ip_address)).to be_nil
  end

  it 'updates tracking fields after the user is authenticated' do
    user = create :user, credentials
    expect_any_instance_of(User).to receive(:update_tracked_fields!)
    User.authenticate(credentials[:email], credentials[:password], ip_address)
  end

end
