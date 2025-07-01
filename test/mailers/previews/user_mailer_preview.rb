# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation

  # the preview of the test i mean like we used one funtion in the session for the controller to work like wise this for the test t o work propperly
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
    end
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/password_reset
  # Preview this email at for the test case
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    UserMailer.password_reset(user)
  end
end
