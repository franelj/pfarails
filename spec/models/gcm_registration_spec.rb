require 'rails_helper'

RSpec.describe AppleRegistration, :type => :model do

  before(:each) do
    @test_user = User.create(username: 'validuser', email: 'validuser@hotmail.fr', password: 'totolehero')
  end

  # Valid registration_id

  it "should validate the registration id" do
    ar = GcmRegistration.create(registration_id: "azertyuiop", user: @test_user)
    expect(ar).to be_valid
  end

  it "should not validate without the device token" do
    ar = GcmRegistration.create(user: @test_user)
    expect(ar).not_to be_valid
  end

  it "should not validate without the user" do
    ar = GcmRegistration.create(registration_id: "azertyuiop")
    expect(ar).not_to be_valid
  end

  # Apple/Android test

  it "should delete the GcmRegistration if a GcmRegistration is created for the user" do
    ar = GcmRegistration.create(registration_id: "azertyuiop", user: @test_user)
    expect(@test_user.apple_registration).to eq(nil)
  end
end
