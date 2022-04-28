class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.alert.subject
  #
  def alert(event)
    @greeting = "#{event.user_name}さん、申し込みありがとうございます！"
    @reserved_date = event.reserved_date
    @usage_time = event.usage_time
    @people = event.people

    mail to: event.user_email,
      subject: "会議室予約完了"
  end
end
