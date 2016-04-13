require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?, "should be valid FAILED"
  end

  test "name should be present" do
   	@user.name = ""
    assert ! @user.valid?, "name should be present FAILED"
  end

  test "email should be invalid if longer than 255 characters" do
  	@user.email = "a" * 256 + "@gmail.com" 
  	assert ! @user.valid?, "email should be invalid if longer than 255 characters FAILED"
  end

  test "email should be valid only if it's well-formed (i.e. doesn't have an impossible format)" do
  	invalid_msg = "email should be invalid"
  	@user.email = "a" * 22 + "gmail.com" 
  	assert ! @user.valid?, "#{invalid_msg} if it does not contain @ FAILED"
  	@user.email = "a" * 22 + "@gmailcom" 
  	assert ! @user.valid?, "#{invalid_msg} if it does not contain '.' after @ FAILED"
  	@user.email = "a" * 22 + "gmailcom"
  	assert ! @user.valid?, "#{invalid_msg} if it does not contain @ or '.' FAILED"
  	@user.email = "a" * 22 + ".gmail@com"
  	assert ! @user.valid?, "#{invalid_msg} if no '.' is present after @ FAILED"
  	@user.email = "a" * 22 + ".gmail@com."
  	assert ! @user.valid?, "#{invalid_msg} if it ends in a '.'"
  	@user.email = "a" * 22 + ".gmail@.com"
  	assert ! @user.valid?, "#{invalid_msg} there's a dot immediately after the @"
  	@user.email = "a" * 22 + "@g@mail.com" 
  	assert ! @user.valid?, "#{invalid_msg} if multiple @ symbols present"
  	@user.email = "a" * 22 + "@gmail..com" 
  	assert ! @user.valid?, "#{invalid_msg} if 2 dots in a row present"
  	@user.email = ".awesf@gmail.com" 
  	assert ! @user.valid?, "#{invalid_msg} if it starts with a ."
  	@user.email = "@gmail.com" 
  	assert ! @user.valid?, "#{invalid_msg} if it starts with @"
  	@user.email = "a" * 22 + "@gmail.com" 
  	assert @user.valid?, "email valid in format: alphanumerics (AN)-> @-> AN-> . -> AN-> no . or @"
  end

  test "email addresses should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert ! duplicate_user.valid?
  end

  test "email addresses should be all lowercase" do
  	mixed_case_email = "aNdFaUlKnEr@gMaIl.com"
  	@user.email = mixed_case_email
  	@user.save
  	assert @user.reload.email.downcase != mixed_case_email

  	lowercase_email = "andfaulkner@gmail.com"
  	@user.email = lowercase_email
  	@user.save
  	assert @user.reload.email.downcase == lowercase_email
  end

  test "password must exist and not contain any whitespace" do
    @user.password = @user.password_confirmation = " " * 6
    assert ! @user.valid?
  end

  test "password must be at least 6 characters long" do
    @user.password = @user.password_confirmation = "a" * 5
    assert ! @user.valid?
  end

  test "user model has authenticate method available" do
    assert @user.respond_to?(:authenticate)
  end

  test "user object returned if the right password is provided to user.authenticate" do
    assert @user.authenticate("foobar").class.name == "User"
  end

 test "false returned if the wrong password is provided to user.authenticate" do
    assert @user.authenticate("greoaiogjai") == false
  end


end