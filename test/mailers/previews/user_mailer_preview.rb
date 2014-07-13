# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/confirmation
  def confirmation
    UserMailer.confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/show_notfication
  def show_notfication
    UserMailer.show_notfication
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/sub_request
  def sub_request
    UserMailer.sub_request
  end

end
