require 'test_helper'

class AssoTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  def setup
    @user = User.new(pseudo: 'test', email:'test@gmail.com',
                 password:'password', password_confirmation: 'password'
                 )
    @asso = Asso.new(register:'3237 378 09 389', name:'Les joyeux turlutons')
  end

  test "should have a REGEX register to be valid" do
  end

  test "should not be valid without register" do
    @asso.register = ''
    assert_not @asso.valid?
  end

  test "name should not be too long" do
    @asso.name = 'a' * 51
    assert_not @asso.valid?
  end

  test "should carry a user_id" do
    @user.save
    @asso.user = @user
    assert @asso.valid?
  end

  test "should not be valid if created from a non recorded user" do
    @asso.user = @user
    assert @asso.valid?
  end

  test "should be saved in Asso database" do
    @asso.user = @user
    assert_difference 'Asso.count', 1 do
      @asso.save
    end
  end



end
