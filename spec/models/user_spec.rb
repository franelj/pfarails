require 'rails_helper'

RSpec.describe User, :type => :model do
  before(:each) do
    @test_user = User.create(username: 'validuser', email: 'validuser@hotmail.fr', password: 'totolehero')
  end

  it 'should be a valid user' do
    expect(@test_user).to_not be_nil
    expect(@test_user.persisted?).to eq(true)
  end

  # Roles

  it 'user has not any other role' do
    expect(@test_user.role).to eq("user")
    expect(@test_user.role).not_to eq("partner")
    expect(@test_user.role).not_to eq("admin")
  end

  it 'partner has not any other role' do
    @test_user.role = 1
    expect(@test_user.role).not_to eq("user")
    expect(@test_user.role).to eq("partner")
    expect(@test_user.role).not_to eq("admin")
  end

  it 'admin has not any other role' do
    @test_user.role = 2
    expect(@test_user.role).not_to eq("user")
    expect(@test_user.role).not_to eq("partner")
    expect(@test_user.role).to eq("admin")
  end


  it 'has user role when it is a new user' do
    expect(@test_user.role).to eq("user")
  end

  # Email tests

  it 'should not be valid without email' do
    email_user = User.create(username: 'validuser', password: 'totolehero')
    expect(email_user).to_not be_valid
  end

  it 'should not be valid with an existing email' do
    email_user = User.create(username: 'validuser', email: @test_user.email, password: 'totolehero')
    expect(email_user).to_not be_valid
  end


  # Password tests

  it 'should have a too small password' do
    pwd_user = User.new(username: 'invalidpassword', email: 'invalidpassword@hotmail.fr', password: 'tot')
    expect(pwd_user).to_not be_valid
  end

  it 'should have a too big password' do
    pwd_user = User.new(username: 'invalidpassword', email: 'invalidpassword@hotmail.fr', password: 't' * 129)
    expect(pwd_user).to_not be_valid
  end

  it 'should have a valid password' do
    pwd_user = User.new(username: 'invalidpassword', email: 'invalidpassword@hotmail.fr', password: 't' * 128)
    expect(pwd_user).to be_valid
    pwd_user = User.new(username: 'invalidpassword', email: 'invalidpassword@hotmail.fr', password: 't' * 8)
    expect(pwd_user).to be_valid
  end


































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































  # Username tests

  it 'should not be valid without username' do
    name_user = User.create(email: 'validuser@hotmail.fr', password: 'totolehero')
    expect(name_user).to_not be_valid
  end

  it 'should not be valid with an existing username' do
    name_user = User.create(username: @test_user.username, email: 'validuser@hotmail.fr', password: 'totolehero')
    expect(name_user).to_not be_valid
  end

  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end

  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end

  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end

  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
  it 'should not be valid with a reserved username' do
    %w(new sign_in sign_out sign_up password auth cancel edit confirmation unlock modo admin moderateur administrateur administrator).each do |username|
      name_user = User.create(username: username, email: 'validuser@hotmail.fr', password: 'totolehero')
      expect(name_user).to_not be_valid
    end
  end
end
