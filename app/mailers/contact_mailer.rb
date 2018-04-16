class ContactMailer < ApplicationMailer

  def contact_mail(achievement)
    @achievement = achievement
    mail to: @achievement.user.email, subject:"つぶやきが投稿されました！"
  end
end
