class Welcomer < ActionMailer::Base
  default :from => "prateek@chronus.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcomer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail :to => @user.email, :subject => 'Welcome'
  end
end
