class UserMailer < ActionMailer::Base
  default from: "noreply@lanilabs.com"
  
  def verification_email(user)
    @user = user
    @user = User.find_by name: @user.name
    @url  = 'http://lanilabs.com/profiles/validation'
    @verificationcode = rand(7 ** 7)
    @user.verificationcode = @verificationcode
    @user.didVerify = false
    @user.save
    mail(to: @user.email, subject: 'Verify your email using the following code :')
  end
  
end
