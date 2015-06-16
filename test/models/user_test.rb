require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
 def setup
   
   @user = User.new(name: "Batuhan", email:"example@asd.com")
   
 end
 
 test "should be valid" do
   assert @user.valid?
 end
 
 test "name should be present" do
   @user.name = "     "
   assert_not @user.valid?
 end
 
 test "email should be present" do
   @user.email = "     "
   assert_not @user.valid?
 end
 
 test "email should be not too long" do
   @user.email = "a" * 256
   assert_not @user.valid?
 end
 
 test "name should be not too long" do
   @user.name= "a" * 51
   assert_not @user.valid?
 end
 
 test "name should be not too short" do
   @user.name= "a" * 3
   assert_not @user.valid?
 end
 
 test "email should be valid address" do
   valid_adresses = %w[naber@lo.com de_hayde@lo.com hadi_123@ulan.com]
   
   valid_adresses.each do |valid_adress|
     @user.email = valid_adress
     assert @user.valid?, "#{valid_adress.inspect} should be valid"
   end
   
 end
 
 test "email should be invalid address" do
   invalid_adresses = %w[@l?.? naber naber@man?.com naber@ula+sie.com
                         naber@naber.+com]
    invalid_adresses.each do |invalid_adresss|
      @user.email = invalid_adresss
      assert_not @user.valid?, "#{invalid_adresss.inspect} should be invalid"
    end
 end
 
 test "should be unique" do
   dubuser = @user.dup
   @user.save
   assert_not dubuser.valid?
 end
 
 
end
