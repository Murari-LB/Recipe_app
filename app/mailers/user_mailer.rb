class UserMailer < ApplicationMailer
	default from: 'murari249@gmail.com'
	layout "mailer"
 
  def info_email(user_email, msg)
    @email = user_email
	mail(:to => @email, :subject=> "Dish Info", body: "Dish #{msg}")
  end

end