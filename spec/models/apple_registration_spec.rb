require 'rails_helper'

RSpec.describe AppleRegistration, :type => :model do

  before(:each) do
    @test_user = User.create(username: 'validuser', email: 'validuser@hotmail.fr', password: 'totolehero')
  end

  # Valid device_token

  it "should validate the device token" do
    ar = AppleRegistration.create(device_token: "azertyuiop", user: @test_user)
    expect(ar).to be_valid
  end

  it "should not validate without the device token" do
    ar = AppleRegistration.create(user: @test_user)
    expect(ar).not_to be_valid
  end

  it "should not validate without the user" do
    ar = AppleRegistration.create(device_token: "azertyuiop")
    expect(ar).not_to be_valid
  end

  # Apple/Android test

  it "should delete the GcmRegistration if a AppleRegistration is created for the user" do
    ar = AppleRegistration.create(device_token: "azertyuiop", user: @test_user)
    expect(@test_user.gcm_registration).to eq(nil)
  end
end
