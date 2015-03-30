require 'rails_helper'

RSpec.describe Challenge, :type => :model do

  # User tests

  it "should validate with users" do
    user1 = User.create(username: 'validuser1', email: 'validuser1@hotmail.fr', password: 'totolehero')
    user2 = User.create(username: 'validuser2', email: 'validuser2@hotmail.fr', password: 'totolehero')
    c = Challenge.create(user1: user1, user2: user2, latitude: "48.8564498645", longitude: "2.368585")
    expect(c).to be_valid
  end

  it "should not validate without one of the users" do
    user1 = User.create(username: 'validuser1', email: 'validuser1@hotmail.fr', password: 'totolehero')
    user2 = User.create(username: 'validuser2', email: 'validuser2@hotmail.fr', password: 'totolehero')
    c = Challenge.create(user1: user1, latitude: "48.8564498645", longitude: "2.368585")
    expect(c).not_to be_valid
    c = Challenge.create(user2: user2, latitude: "48.8564498645", longitude: "2.368585")
    expect(c).not_to be_valid
  end

  it "should not validate if one of the users is in a challenge" do
    user1 = User.create(username: 'validuser1', email: 'validuser1@hotmail.fr', password: 'totolehero')
    user2 = User.create(username: 'validuser2', email: 'validuser2@hotmail.fr', password: 'totolehero')
    c = Challenge.create(user1: user1, user2: user2, latitude: "48.8564498645", longitude: "2.368585")
    user3 = User.create(username: 'validuser3', email: 'validuser3@hotmail.fr', password: 'totolehero')
    c1 = Challenge.create(user1: user1, user2: user3, latitude: "48.8564498645", longitude: "2.368585")
    expect(c).to be_valid
    expect(user1.is_in_challenge?).to eq(true)
    expect(c1).not_to be_valid
  end

  # Location tests

  it "should validate with latitude and longitude" do
    user1 = User.create(username: 'validuser1', email: 'validuser1@hotmail.fr', password: 'totolehero')
    user2 = User.create(username: 'validuser2', email: 'validuser2@hotmail.fr', password: 'totolehero')
    c = Challenge.create(user1: user1, user2: user2, latitude: "48.8564498645", longitude: "2.368585")
    expect(c).to be_valid
  end

  it "should not validate without latitude or longitude" do
    user1 = User.create(username: 'validuser1', email: 'validuser1@hotmail.fr', password: 'totolehero')
    user2 = User.create(username: 'validuser2', email: 'validuser2@hotmail.fr', password: 'totolehero')
    c = Challenge.create(user1: user1, longitude: "2.368585")
    expect(c).not_to be_valid
    c = Challenge.create(user2: user2, latitude: "48.8564498645")
    expect(c).not_to be_valid
  end

end
